-- | `Region`s are used to figure out the bounds of collections of managed elements. The difficulty lies mostly in empty
-- | managed regions, they have nothing to get a hold of and need to be managed outside of the DOM. To communicate the
-- | presence or absence of elements, `Region`s have to use `Bump` to signal to their parents that they contain an
-- | element that can be used to locate a region or `Clear` to signal that no elements to locate.
-- |
-- | It is then the responsibilty of the parent to use the information of all its children to provide correct `Bound`
-- | information to i.e. `DOMInterpret` to use `attachElement` or `beamRegion`. A `Bump` causes all following `Region`s
-- | to update their begin(and their end when empty) until a new non-empty region is found. A `Clear` causes the
-- | inverse. First a non-empty `Region` has be found which will be used to update the beginning of all following empty
-- | `Region`s until a new non-empty `Region` is found.
module Deku.Internal.Region
    ( Anchor(..)
    , Bound
    , Region(..)
    , StaticRegion(..)
    , RegionSpan(..)
    , fromParent
    ) where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as ST
import Control.Monad.ST.Uncurried (STFn1, STFn2, STFn3, mkSTFn1, mkSTFn2, mkSTFn3, runSTFn1, runSTFn2, runSTFn3)
import Data.Array as Array
import Data.Array.ST as STArray
import Data.Foldable (traverse_)
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Newtype (class Newtype, un)
import Deku.Internal.Entities (DekuElement, DekuParent, DekuText)
import FRP.Event (createPure)
import FRP.Poll (Poll, pollFromEvent, stRefToPoll)
import Partial.Unsafe (unsafePartial)
import Prim.TypeError (class Fail, class Warn, Text)
import Unsafe.Coerce (unsafeCoerce)

data Anchor
  = ParentStart DekuParent
  | Element DekuElement
  | Text DekuText

type Bound =
    ST.ST Global Anchor

type Bump =
    STFn1 Bound Global Unit

type Clear =
    ST.ST Global Unit

-- | Region that supports adding, moving and removing new child regions.
newtype Region = Region
    { begin :: Bound
    , end :: Bound

    , position :: Poll Int
    , sendTo :: STFn1 Int Global Unit
    , remove :: ST.ST Global Unit

    , static :: StaticRegion
    }
derive instance Newtype Region _

-- | Region that supports adding new regions and elements.
newtype StaticRegion = StaticRegion
    { end :: Bound
    , span :: ST.ST Global RegionSpan
    , element :: STFn1 Anchor Global Unit
    }
derive instance Newtype StaticRegion _

type ManagedRegionBound =
    ST.STRef Global { owned :: ST.STRef Global Int, ref :: Bound }

type ManagedRegion =
    { ix :: ST.ST Global Int
    , pushIx :: STFn1 Int Global Unit
    , position :: Poll Int
    , begin :: ManagedRegionBound
    , end :: ManagedRegionBound
    }

-- | Managed span of `Region`s.
newtype RegionSpan =
    RegionSpan ( STFn1 ( Maybe Int ) Global Region )
derive instance Newtype RegionSpan _

newSpan :: STFn3 Bound Bump Clear Global RegionSpan
newSpan = mkSTFn3 \parent parentBump parentClear -> do
    children <- STArray.new
    -- bound owned by an element outside of this region
    parentBound <- do
        owned <- ST.new (-1)
        ST.new { owned, ref : parent } 

    pure $ RegionSpan $ mkSTFn1 \givenPos -> do
        managed@{ position, ix } <- runSTFn3 pushManaged parentBound givenPos children
        let
            begin :: Bound
            begin =
                join $ _.ref <$> ST.read managed.begin

            end :: Bound
            end =
                join $ _.ref <$> ST.read managed.end

            bump :: Bump
            bump = mkSTFn1 \anchor -> do
                whenM ( runSTFn2 isLast ix children ) ( runSTFn1 parentBump anchor )

            clear :: Clear
            clear =
                todo

            sendTo :: STFn1 Int Global Unit
            sendTo = mkSTFn1 \pos -> do
                lastEnd <- ST.new $ Nothing @Bound
                whenM ( runSTFn1 isEmpty managed ) do
                    { ref } <- ST.read managed.end
                    void $ ST.write ( Just ref ) lastEnd
                    -- signal a clear so the previous region get's hooked up to the following
                    clear

                -- now safe to move
                lastIx <- ix
                removed <- STArray.splice lastIx ( lastIx + 1 ) [] children
                void $ STArray.splice pos pos removed children
                newBegin <- ST.read =<< ( maybe parentBound _.end <$> STArray.peek ( pos - 1 ) children )
                void $ ST.write newBegin managed.begin
                void $ ST.write newBegin managed.end

                -- TODO: expensive operation
                runSTFn3 fixManaged ( min lastIx pos ) updateIx children
                
                -- if we had any elements we signal a bump 
                ST.read lastEnd >>= traverse_ ( runSTFn1 bump )

            remove :: ST.ST Global Unit
            remove = do
                clear
                lastIx <- ix
                void $ STArray.splice lastIx ( lastIx + 1 ) [] children
                runSTFn3 fixManaged lastIx updateIx children

        static <- runSTFn3 newStaticRegion begin bump clear
        pure $ Region { begin, end, position, sendTo, remove, static }

isEmpty :: STFn1 ManagedRegion Global Boolean
isEmpty = mkSTFn1 \{ ix, end } -> do
    { owned } <- ST.read end
    -- if the `ManagedRegion` does not own its end it's considered empty
    notEq <$> ST.read owned <*> ix

isLast :: forall a . STFn2 ( ST.ST Global Int ) ( STArray.STArray Global a ) Global Boolean
isLast = mkSTFn2 \ix children -> do
    i <- ix
    l <- STArray.length children
    pure ( i == l - 1 )

pushManaged :: STFn3 ManagedRegionBound ( Maybe Int ) ( STArray.STArray Global ManagedRegion ) Global ManagedRegion
pushManaged = mkSTFn3 \parentBound givenPos children -> do 
    length <- STArray.length children
    let
        pos :: Int
        pos = clamp 0 length $ fromMaybe length givenPos

    ixRef <- ST.new pos
    posEvent <- createPure 
    
    prevBegin <- ST.read =<< maybe parentBound _.end <$> STArray.peek ( pos - 1 ) children
    begin <- ST.new prevBegin
    end <- ST.new prevBegin
    let
        pushIx :: STFn1 Int Global Unit
        pushIx = mkSTFn1 \i -> do
            void $ ST.write i ixRef
            posEvent.push i

        ix :: ST.ST Global Int
        ix =
            ST.read ixRef

        position :: Poll Int
        position = stRefToPoll ixRef <|> pollFromEvent posEvent.event

        managed :: ManagedRegion
        managed =
            { ix, begin, end, pushIx, position }

    void $ STArray.splice pos pos [ managed ] children
    
    -- TODO: expensive operation
    runSTFn3 fixManaged ( pos + 1 ) updateIx children
    pure managed

updateIx :: STFn2 Int ManagedRegion Global Unit
updateIx =
    mkSTFn2 \i { pushIx } -> runSTFn1 pushIx i

fixManaged :: STFn3 Int ( STFn2 Int ManagedRegion Global Unit ) ( STArray.STArray Global ManagedRegion ) Global Unit
fixManaged = mkSTFn3 \from fn children -> do
    length <- STArray.length children
    elems <- STArray.unsafeFreeze children
    ST.for from length \ix -> do
        runSTFn2 fn ix ( unsafePartial ( Array.unsafeIndex elems ix ) )

data StaticRegionState
    = Anchored ( ST.ST Global Anchor )
    | Spanning RegionSpan

isSpanning :: StaticRegionState -> Boolean
isSpanning = case _ of
    Spanning _ -> true
    _ -> false

newStaticRegion :: STFn3 Bound Bump Clear Global StaticRegion
newStaticRegion = mkSTFn3 \parent bump clear -> do
    spanCounter <- ST.new (-1) -- making the first span 0
    -- when any static element is added it can not be removed by this static region so this anchor can be used to bump 
    -- when the last child span signals a clear
    state <- ST.new $ Anchored parent

    end <- ST.new parent
    pure $ StaticRegion
        { end : join $ ST.read end
        , span : do
            -- find or create a span
            RegionSpan span <- ST.read state >>= case _ of
                Anchored begin -> do
                    spanIx <- ST.modify ( add 1 ) spanCounter
                    span <- runSTFn3 newSpan
                        ( begin )
                        ( mkSTFn1 \a -> whenM ( eq spanIx <$> ST.read spanCounter ) do
                            void $ ST.write a end
                            runSTFn1 bump a
                        )
                        ( whenM ( eq spanIx <$> ST.read spanCounter ) do
                            void $ ST.write begin end
                            -- only signal clear when we are the first and only span
                            when ( spanIx == 0 ) clear
                        )

                    pure span

                Spanning span ->
                    pure span
            
            -- allocate a new region
            Region region <- runSTFn1 span Nothing

            -- create a single span in that region, this double allocation is necessary to isolate two spans in the same
            -- static region.
            ( un StaticRegion region.static ).span

        , element : mkSTFn1 \anchor' -> do
            let anchor = pure anchor'
            whenM ( isSpanning <$> ST.read state ) do
                -- clear span state
                void $ ST.write ( Anchored anchor ) state
                -- signal that the last span is no longer allowed to bump or clear
                void $ ST.modify ( add 1 ) spanCounter
            
            void $ ST.write anchor end
            runSTFn1 bump anchor
        }

fromParent :: STFn1 DekuParent Global StaticRegion
fromParent = 
    mkSTFn1 \parent -> runSTFn3 newStaticRegion ( pure $ ParentStart parent ) ( mkSTFn1 \_ -> pure unit ) mempty

todo :: forall a . Fail ( Text "todo" ) => a
todo = 
    unsafeCoerce unit
