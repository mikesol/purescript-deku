module Deku.Internal.Region
    where

import Prelude

import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as ST
import Control.Monad.ST.Uncurried (STFn1, STFn3, mkSTFn1, mkSTFn3, runSTFn1, runSTFn3)
import Data.Array.ST as STArray
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (class Newtype, un)
import Deku.Internal.Entities (DekuElement, DekuParent, DekuText)
import FRP.Poll (Poll)
import Prim.TypeError (class Warn, Text)
import Unsafe.Coerce (unsafeCoerce)

data Anchor
  = ParentStart DekuParent
  | Element DekuElement
  | Text DekuText

type Bound =
    ST.ST Global Anchor

type Bump =
    STFn1 Anchor Global Unit

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
    , element :: Bump
    }
derive instance Newtype StaticRegion _

type ManagedRegion =
    { ix :: ST.STRef Global Int
    , begin :: Bound
    , end :: ST.STRef Global { owned :: Boolean, ref :: Bound }
    }

-- | Managed span of `Region`s.
newtype RegionSpan =
    RegionSpan ( STFn1 ( Maybe Int ) Global Region )
derive instance Newtype RegionSpan _

newSpan :: STFn3 Bound Bump Clear Global RegionSpan
newSpan = mkSTFn3 \parent bump clear -> do
    children <- STArray.new
    
    pure $ RegionSpan $ mkSTFn1 \pos -> do
        length <- STArray.length children
        ix <- ST.new $ fromMaybe length pos
        void $ STArray.push { ix, begin : todo, end : todo } children

        pure $ Region
            { begin : todo
            , end : todo
            
            , position : todo
            , sendTo : todo
            , remove : todo

            , static : StaticRegion
                { end : todo
                , element : todo
                , span : todo
                }
            }

newStaticRegion :: STFn1 Bound Global StaticRegion
newStaticRegion = mkSTFn1 \parent -> do
    state <- ST.new Nothing
    end <- ST.new =<< ST.new =<< parent
    pure $ StaticRegion
        { end : ST.read =<< ST.read end
        , span : do
            RegionSpan span <- ST.read state >>= case _ of
                Nothing -> do
                    -- begin can't change ever, it's static
                    begin <- ST.read =<< ST.read end
                    spanEnd <- ST.new begin
                    void $ ST.write spanEnd end 
                    span <- runSTFn3 newSpan
                        ( pure begin )
                        ( mkSTFn1 \a -> void $ ST.write a spanEnd )
                        ( void $ ST.write begin spanEnd )

                    pure span

                Just span ->
                    pure span

            Region region <- runSTFn1 span Nothing
            ( un StaticRegion region.static ).span

        , element : mkSTFn1 \anchor -> do
            ST.read state >>= case _ of
                Nothing ->
                    void $ ST.write anchor <$> ST.read end
                
                Just _ -> do
                    -- detach end of span from writing to the end
                    void $ ST.write <$> ST.new anchor <@> end
                    -- clear span state
                    void $ ST.write Nothing state
        }


todo :: forall a . Warn ( Text "todo" ) => a
todo = 
    unsafeCoerce unit
