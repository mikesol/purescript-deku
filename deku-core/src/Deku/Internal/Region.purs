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
import Control.Monad.ST.Uncurried (STFn1, STFn2, STFn3, STFn4, mkSTFn1, mkSTFn2, mkSTFn3, mkSTFn4, runSTFn1, runSTFn2, runSTFn3, runSTFn4)
import Control.Plus (empty)
import Data.Array as Array
import Data.Array.ST as STArray
import Data.Foldable (traverse_)
import Data.Maybe (Maybe(..), fromJust, fromMaybe)
import Data.Newtype (class Newtype, un)
import Deku.Internal.Entities (DekuElement, DekuParent, DekuText)
import FRP.Event (createPure)
import FRP.Poll (Poll, pollFromEvent, stRefToPoll)
import Partial.Unsafe (unsafePartial)

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

type SharedBound' =
    { owner :: ST.STRef Global ( ST.ST Global Int )
    , extent :: ST.STRef Global ( ST.ST Global Int )
    , ref :: ST.STRef Global Bound
    }

type SharedBound =
    ST.STRef Global SharedBound'

type ManagedRegion =
    { ix :: ST.ST Global Int
    , pushIx :: STFn1 Int Global Unit
    , position :: Poll Int
    , begin :: SharedBound
    , end :: SharedBound
    }

readSharedBound :: STFn1 SharedBound Global Anchor
readSharedBound = mkSTFn1 \shared -> do
    { ref } <- ST.read shared
    bound <- ST.read ref
    bound

-- | Managed span of `Region`s.
newtype RegionSpan =
    RegionSpan ( STFn1 ( Maybe Int ) Global Region )
derive instance Newtype RegionSpan _

newSpan :: STFn3 Bound Bump Clear Global RegionSpan
newSpan = mkSTFn3 \parent parentBump parentClear -> do
    children <- STArray.new
    -- bound owned by an element outside of this region
    
    parentRef <- ST.new 0
    parentBound <- do
        owner <- ST.new $ ST.read parentRef
        extent <- ST.new $ ST.read parentRef
        ref <- ST.new parent
        ST.new { owner, extent, ref } 
    let 
        parentRegion :: ManagedRegion
        parentRegion =
            { ix : ST.read parentRef
            , pushIx : mkSTFn1 \_ -> mempty
            , position : empty
            , begin : parentBound
            , end : parentBound
            }
    void $ STArray.push parentRegion children
    pure $ RegionSpan $ mkSTFn1 \givenPos -> do
        managed@{ position, ix } <- runSTFn2 insertManaged givenPos children
        let
            begin :: Bound
            begin =
                runSTFn1 readSharedBound managed.begin

            end :: Bound
            end =
                runSTFn1 readSharedBound managed.end

            bump :: Bump
            bump = mkSTFn1 \bound -> do
                runSTFn3 bumpBound bound managed children
                whenM ( runSTFn2 isLastBound managed children ) ( runSTFn1 parentBump bound )

            clear :: Clear
            clear = do
                runSTFn2 clearBound managed children
                whenM ( runSTFn1 isClear children ) do
                    parentClear

            sendTo :: STFn1 Int Global Unit
            sendTo = mkSTFn1 \pos -> do
                lastBound <- ST.new $ Nothing @Bound
                wasLast <- runSTFn2 isLastBound managed children
                whenM ( not <$> runSTFn1 isEmpty managed ) do
                    { ref } <- ST.read managed.end
                    bound <- ST.read ref
                    void $ ST.write ( Just bound ) lastBound
                    -- clear the region so the previous region get's hooked up to the following
                    runSTFn2 clearBound managed children

                -- now safe to move, indices becoming invalid
                lastIx <- ix
                removed <- STArray.splice lastIx ( lastIx + 1 ) [] children
                void $ STArray.splice pos pos removed children

                newBegin <- runSTFn2 shareBound managed.ix children
                void $ ST.write newBegin managed.begin
                void $ ST.write newBegin managed.end

                -- restoring indices
                runSTFn3 fixManaged ( min lastIx pos ) updateIx children
                
                -- if we had any elements we signal a bump, this requires the indices to be valid so we do it last
                ST.read lastBound >>= traverse_ \bound -> runSTFn3 bumpBound bound managed children

                -- update parent when necessary
                nowLast <- runSTFn2 isLastBound managed children
                when ( wasLast /= nowLast ) do
                    runSTFn2 rebumpLast parentBump children

            remove :: ST.ST Global Unit
            remove = do
                clear
                finalIx <- ix
                void $ STArray.splice finalIx ( finalIx + 1 ) [] children
                runSTFn3 fixManaged finalIx updateIx children

        static <- runSTFn3 newStaticRegion begin bump clear
        pure $ Region { begin, end, position, sendTo, remove, static }

-- | Determines the final `Bound` and runs the provided effect on it.
-- | ASSUMES that the last element is not the parent.
rebumpLast :: STFn2 ( STFn1 Bound Global Unit ) ( STArray.STArray Global ManagedRegion ) Global Unit
rebumpLast = mkSTFn2 \bump children -> do
    length <- STArray.length children
    STArray.peek ( length - 1 ) children >>= traverse_ \lastRegion -> do
        end <- ST.read lastRegion.end
        bound <- ST.read end.ref
        runSTFn1 bump bound

-- | Uses the bound information to infer if the whole span is empty.
isClear :: STFn1 ( STArray.STArray Global ManagedRegion ) Global Boolean
isClear = mkSTFn1 \children -> do
    length <- STArray.length children
    -- there is always atleast one element
    last <- unsafePartial $ fromJust <$> STArray.peek ( length - 1 ) children
    begin <- ST.read last.begin
    owner <- join $ ST.read begin.owner
    if owner > 0 then -- begin is not parent so we have atleat one non-empty element
        pure false
    else do
        extent <- join $ ST.read begin.extent
        pure $ ( length - 1 ) == extent

isEmpty :: STFn1 ManagedRegion Global Boolean
isEmpty = mkSTFn1 \{ ix, end } -> do
    { owner } <- ST.read end
    -- if the `ManagedRegion` does not own its end it's considered empty
    notEq <$> ( join $ ST.read owner ) <*> ix

-- | Returns whether the `ManagedRegion` controls the ending bound of the whole span.
isLastBound :: STFn2 ManagedRegion ( STArray.STArray Global ManagedRegion ) Global Boolean
isLastBound = mkSTFn2 \region children -> do
    length <- STArray.length children
    end <- ST.read region.end
    owner <- join $ ST.read end.owner
    pos <- region.ix
    extent <- join $ ST.read end.extent
    pure $ owner == pos && extent == length - 1

-- | Creates a new `ShareBound'` value for an empty `ManagedRegion`. It looks up the preceding `ManagedRegion` and uses
-- | its end `SharedBound` possibly extending it.
shareBound :: STFn2 ( ST.ST Global Int ) ( STArray.STArray Global ManagedRegion ) Global SharedBound'
shareBound = mkSTFn2 \posRef children -> do
    pos <- posRef
    -- prev should always be present, shareBound is called with an actual child element and the first element is the
    -- always the parentRegion
    prev <- unsafePartial $ fromJust <$> STArray.peek ( pos - 1 ) children
    beginFromPrev <- ST.read prev.end
    currentExtent <- join $ ST.read beginFromPrev.extent
    
    -- If the currentExtent is equal or greater to our pos then the region will be inserted before the end of the
    -- `SharedBound` and we dont have to anything.
    -- otherwise we are getting inserted at the end of the `SharedBound` so we set it up to track our position 
    when ( currentExtent < pos ) do
        void $ ST.write posRef beginFromPrev.extent
    
    pure beginFromPrev
    
-- | Lifts a `ManagedRegion` out of the `RegionSpan`, restoring the `SharedBound`s of its siblings.
clearBound :: STFn2 ManagedRegion ( STArray.STArray Global ManagedRegion ) Global Unit
clearBound = mkSTFn2 \cleared children -> do
    clearedBound <- ST.read cleared.end
    prevBound <- ST.read cleared.begin

    extentToEff <- ST.read clearedBound.extent
    extentToIx <- extentToEff
    ownerEff <- ST.read prevBound.owner
    ownerIx <- ownerEff
    selfIx <- join $ ST.read prevBound.extent

    -- choose the smaller `SharedBound` to update
    if selfIx - ownerIx > extentToIx - selfIx then do
        -- the following owned `SharedBound` was smaller
        void $ ST.write extentToEff prevBound.extent
        runSTFn4 fixManagedTo selfIx ( extentToIx + 1 ) ( updateShared prevBound ) children

    else do
        -- the preceding not owned `SharedBound` was smaller, update the clearedBound with the information of
        -- prevBound and update the `ManagedRegion`s
        ref <- ST.read prevBound.ref
        void $ ST.write ref clearedBound.ref
        void $ ST.write ownerEff clearedBound.owner

        STArray.peek ( ownerIx ) children >>= traverse_ \{ end } -> void $ ST.write clearedBound end
        runSTFn4 fixManagedTo ( ownerIx + 1 ) ( selfIx + 1 ) ( updateShared clearedBound ) children

-- | Updates the end of a `ManagedRegion`. If it shares that bound with a preceding sibling it will set up a new
-- | `SharedBound` that it owns and propagates it to all following members of the old `SharedBound`. 
-- | Or it hijacks the previous `SharedBound`. 
bumpBound :: STFn3 Bound ManagedRegion ( STArray.STArray Global ManagedRegion ) Global Unit
bumpBound = mkSTFn3 \bound bumped children -> do
    empty <- runSTFn1 isEmpty bumped
    if not empty then do
        ownedBound <- ST.read bumped.end
        void $ ST.write bound ownedBound.ref
    else do
        prevExtent <- ST.read bumped.begin
        ownerEff <- ST.read prevExtent.owner
        ownerIx <- ownerEff

        extentToEff <- ST.read prevExtent.extent
        extentToIx <- extentToEff
        selfIx <- bumped.ix

        prev <- unsafePartial $ fromJust <$> STArray.peek ( selfIx - 1 ) children
        -- find the smallest possible update
        if selfIx - ownerIx > extentToIx - selfIx then do
            -- the following `SharedBound` will be smaller
            void $ ST.write prev.ix prevExtent.extent
            newShared <- do
                owner <- ST.new bumped.ix
                extent <- ST.new extentToEff
                ref <- ST.new bound
                pure { owner, extent, ref }

            void $ ST.write newShared bumped.end 
            runSTFn4 fixManagedTo ( selfIx + 1 ) extentToIx ( updateShared newShared ) children

        else do
            -- preceding `SharedBound` will be smaller
            newShared <- do
                owner <- ST.new ownerEff
                extent <- ST.new prev.ix
                ref <- ST.new =<< ST.read prevExtent.ref
                pure { owner, extent, ref }

            -- hijack longer `SharedBound` and update it with our own info
            void $ ST.write bumped.ix prevExtent.owner
            void $ ST.write bound prevExtent.ref

            void $ ST.write newShared bumped.begin
            STArray.peek ownerIx children >>= traverse_ \ownerRegion -> void $ ST.write newShared ownerRegion.end
            runSTFn4 fixManagedTo ( ownerIx - 1 ) ( selfIx - 1 ) ( updateShared newShared ) children

insertManaged :: STFn2 ( Maybe Int ) ( STArray.STArray Global ManagedRegion ) Global ManagedRegion
insertManaged = mkSTFn2 \givenPos children -> do 
    length <- STArray.length children
    let
        pos :: Int
        pos = clamp 0 length $ fromMaybe length givenPos

    ixRef <- ST.new pos
    posEvent <- createPure 
    
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

    prevBegin <- runSTFn2 shareBound ix children
    begin <- ST.new prevBegin
    end <- ST.new prevBegin

    let
        managed :: ManagedRegion
        managed =
            { ix, begin, end, pushIx, position }

    void $ STArray.splice pos pos [ managed ] children
    
    runSTFn3 fixManaged ( pos + 1 ) updateIx children
    pure managed

updateShared :: SharedBound' -> STFn2 Int ManagedRegion Global Unit
updateShared shared = mkSTFn2 \_ region -> do 
    void $ ST.write shared region.begin
    void $ ST.write shared region.end

updateIx :: STFn2 Int ManagedRegion Global Unit
updateIx =
    mkSTFn2 \i { pushIx } -> runSTFn1 pushIx i

-- TODO: expensive operation
fixManaged :: STFn3 Int ( STFn2 Int ManagedRegion Global Unit ) ( STArray.STArray Global ManagedRegion ) Global Unit
fixManaged = mkSTFn3 \from fn children -> do
    length <- STArray.length children
    runSTFn4 fixManagedTo from length fn children

fixManagedTo :: STFn4 Int Int ( STFn2 Int ManagedRegion Global Unit ) ( STArray.STArray Global ManagedRegion ) Global Unit
fixManagedTo = mkSTFn4 \from to fn children -> do
    elems <- STArray.unsafeFreeze children
    ST.for from to \ix -> do
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
