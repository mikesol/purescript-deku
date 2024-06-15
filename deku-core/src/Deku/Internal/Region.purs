module Deku.Internal.Region where

import Prelude

import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal as ST
import Control.Monad.ST.Uncurried (STFn1, STFn2, mkSTFn1, mkSTFn2, runSTFn1, runSTFn2)
import Data.Newtype (class Newtype)
import Deku.Internal.Entities (DekuElement, DekuParent, DekuText)

data BoundAnchor
  = ParentStart DekuParent
  | Element DekuElement
  | Text DekuText

-- | Defines a half open interval (begin,end] of elements. `begin` is not included and `end` is included.
newtype DekuRegion =
  DekuRegion { begin :: Bound, end :: Bound }
derive instance Newtype DekuRegion _

regionBegin :: STFn1 DekuRegion Global BoundAnchor
regionBegin = mkSTFn1 \( DekuRegion { begin } ) -> do
    runSTFn1 readBound begin

regionEnd :: STFn1 DekuRegion Global BoundAnchor
regionEnd = mkSTFn1 \( DekuRegion { end } ) -> do
    runSTFn1 readBound end

-- | Creates a new empty region at the end of the given region. The begin of the new region is controlled by the end of
-- | the previous region on the same parent. The end of the new region controls the end of the parent region.
-- |
-- | ```
-- | 
-- |    ┌─┐    |    ┌─┐                ┌─┐
-- |    │e│    |    │e│                │e│
-- |    └▲┘    |    └▲┘                └▲┘
-- |     │     |     │                  │ 
-- |    ┌┴┐    |    ┌┴┐                ┌┴┐
-- |    │1│   -->   │1◄────────┐    ┌──►2│
-- |    └▲┘    |    └─┘        │    │  └▲┘
-- |     │     |               │    │   │ 
-- |     │     |     ┌─────────┼────┘   │ 
-- |     │     |     │         │        │ 
-- | parentend | parentend   begin     end
-- |
-- | ```
managedRegion :: STFn1 DekuRegion Global DekuRegion
managedRegion = mkSTFn1 \( DekuRegion { end } ) -> do
    newBegin <- runSTFn1 shareBound end -- shallow copy to share anchor with previous region
    newEnd <- runSTFn1 copyBound end -- deep copy to control our own end

    runSTFn2 matchBound newEnd end -- share our end with parent region
    pure ( DekuRegion { begin : newBegin, end : newEnd } )

-- | Creates a new region at the head of a given region.
-- |
-- | ```
-- | 
-- |  ┌─┐          ┌─┐     |     ┌─┐              ┌─┐          ┌─┐
-- |  │b|          │e│     |     │b│              │b│          │e│
-- |  └▲┘          └▲┘     |     └▲┘              └▲┘          └▲┘
-- |   │            │      |      │                │            │ 
-- |  ┌┴┐          ┌┴┐     |     ┌┴┐              ┌┴┐          ┌┴┐
-- |  │1◄──────┐   │2│    -->    │1◄───────┐      │3◄──────┐   │2│
-- |  └▲┘      │   └▲┘     |     └▲┘       │      └▲┘      │   └▲┘
-- |   │       │    │      |      │        │       │       │    │ 
-- |   │       │    │      |      │        │       │       │    │ 
-- | prevEnd begin end     |    prevEnd newBegin newEnd   begin end
-- |
-- | ```
shiftRegion :: STFn1 DekuRegion Global DekuRegion
shiftRegion = mkSTFn1 \( DekuRegion { begin } ) -> do
    newBegin <- runSTFn1 shareBound begin
    newEnd <- runSTFn1 copyBound begin
    runSTFn2 matchBound newEnd begin
    pure $ DekuRegion { begin : newBegin, end : newEnd }



-- | Sets the end of a region to a new anchor.
pushRegionEnd :: STFn2 BoundAnchor DekuRegion Global Unit
pushRegionEnd = mkSTFn2 \anchor ( DekuRegion { end } ) -> do
    runSTFn2 writeBound anchor end

-- | Entangles a sub region with its parent region setting the end of the parent region to the end of the sub region.
-- | This way when the sub region extends the parent region reflects this.
matchEnd :: STFn2 DekuRegion DekuRegion Global Unit
matchEnd = mkSTFn2 \( DekuRegion { end : sub } ) ( DekuRegion { end : parent } ) -> do
    runSTFn2 matchBound sub parent

-- | A boundary that can be shared between regions.
newtype Bound =
  -- double indirection so we can change were a region is reading from
  Bound ( ST.STRef Global ( ST.STRef Global BoundAnchor ) ) 

newBound :: STFn1 BoundAnchor Global Bound
newBound = mkSTFn1 $ map Bound <<< ST.new <=< ST.new

readBound :: STFn1 Bound Global BoundAnchor
readBound = mkSTFn1 \( Bound b ) -> do
    ST.read =<< ST.read b

writeBound :: STFn2 BoundAnchor Bound Global Unit
writeBound = mkSTFn2 \anchor ( Bound ref ) -> do
    void $ ST.write anchor <$> ST.read ref

-- | Creates a new copy of a bound with no sharing.
copyBound :: STFn1 Bound Global Bound
copyBound = mkSTFn1 \( Bound src ) ->
    map Bound $ ST.new =<< ST.new =<< ST.read =<< ST.read src

-- | Creates a shallow copy of a Bound where both the original and the copy still share the bound.
shareBound :: STFn1 Bound Global Bound
shareBound = mkSTFn1 \( Bound ref ) -> do
    map Bound $ ST.new =<< ST.read ref

-- | Entangles two `Bound`s so they share the same value. The target `Bound` loses its value.
matchBound :: STFn2 Bound Bound Global Unit
matchBound = mkSTFn2 \( Bound src ) ( Bound target ) -> do
    void $ ST.write <$> ST.read src <@> target
