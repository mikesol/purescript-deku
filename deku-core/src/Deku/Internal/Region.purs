-- | `Region`s are used to figure out the bounds of collections of managed elements. The difficulty lies mostly in empty
-- | managed regions, they have nothing to get a hold of and need to be managed outside of the DOM. To communicate the
-- | presence or absence of elements, `Region`s have to use `Bump Just` to signal to their parents that they contain an
-- | element that can be used to locate a region or `Bump Nothing` to signal that it contains no elements to locate.
-- |
-- | It is then the responsibilty of the parent to use the information of all its children to provide correct `Bound`
-- | information to i.e. `DOMInterpret` to use `attachElement` or `beamRegion`. A `Bump Just` causes all following `Region`s
-- | to update their begin(and their end when empty) until a new non-empty region is found. A `Bump Nothing` causes the
-- | inverse. First a non-empty `Region` has be found which will be used to update the beginning of all following empty
-- | `Region`s until a new non-empty `Region` is found.
module Deku.Internal.Region
  ( Anchor(..)
  , Bound
  , Region(..)
  , StaticRegion(..)
  , RegionSpan(..)
  , Bump
  , fromParent
  , newStaticRegion
  , newSpan
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
import Data.Maybe (Maybe(..), fromJust, fromMaybe, isJust)
import Data.Newtype (class Newtype)
import Deku.Internal.Entities (DekuElement, DekuParent, DekuText)
import Effect.Exception.Unsafe (unsafeThrow)
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
  STFn1 (Maybe Anchor) Global Unit

-- | Region that supports adding, moving and removing new child regions.
newtype Region = Region
  { begin :: Bound
  , end :: Bound

  , position :: Poll Int
  , sendTo :: STFn1 Int Global Unit
  , remove :: ST.ST Global Unit

  , bump :: Bump
  }

derive instance Newtype Region _

-- | Region that supports adding new regions and elements.
newtype StaticRegion = StaticRegion
  { end :: Bound
  , region :: ST.ST Global Region
  , element :: STFn1 Anchor Global Unit
  }

derive instance Newtype StaticRegion _

type SharedBound' =
  { owner :: ST.STRef Global (ST.ST Global Int)
  -- last element that uses this bound
  , extent :: ST.STRef Global (ST.ST Global Int)
  , bound :: Bound
  , pushAnchor :: STFn1 Anchor Global Unit
  }

type SharedBound =
  ST.STRef Global SharedBound'

type ManagedRegion =
  { ix :: ST.ST Global Int
  , pushIx :: STFn1 Int Global Unit
  , position :: Poll Int
  , end :: SharedBound
  }

type Children =
  STArray.STArray Global ManagedRegion

readSharedBound :: STFn1 SharedBound Global Anchor
readSharedBound = mkSTFn1 \shared -> do
  { bound } <- ST.read shared
  bound
  
-- | Managed span of `Region`s.
newtype RegionSpan =
  RegionSpan (STFn1 (Maybe Int) Global Region)

derive instance Newtype RegionSpan _

newSpan :: STFn2 Bound Bump Global RegionSpan
newSpan = mkSTFn2 \parent parentBump -> do
  children <- STArray.new

  -- bound owned by an element outside of this region
  parentBound <- do
    owner <- ST.new $ pure 0
    extent <- ST.new $ pure 0
    let
      -- we cant actually update the beginning given from the parent, so this dummy has to do
      -- `bumpBound` and `clearBound` have safeguards to never call this effect
      pushAnchor :: STFn1 Anchor Global Unit
      pushAnchor =
        mkSTFn1 \_ -> unsafeThrow "parent forced to update anchor"
    
    ST.new { owner, extent, bound : parent, pushAnchor }
  
  let
    parentRegion :: ManagedRegion
    parentRegion =
      { ix: pure 0
      , pushIx: mkSTFn1 \_ -> unsafeThrow "parent forced to update index"
      , position: empty
      , end: parentBound
      }
  void $ STArray.push parentRegion children
  pure $ RegionSpan $ mkSTFn1 \givenPos -> do
    managed@{ position, ix } <- runSTFn2 insertManaged givenPos children
    let
      begin :: Bound
      begin =
        runSTFn2 beginBound managed children

      end :: Bound
      end =
        runSTFn1 readSharedBound managed.end

      bump :: Bump
      bump = mkSTFn1 case _ of
        Nothing -> do
          runSTFn2 clearBound managed children
          whenM (runSTFn1 isClear children) do
            runSTFn1 parentBump Nothing

        b@(Just anchor) -> do
          runSTFn3 bumpBound anchor managed children
          whenM (runSTFn2 isLastBound managed children) do
            runSTFn1 parentBump b

      sendTo :: STFn1 Int Global Unit
      sendTo = mkSTFn1 \pos -> do
        -- safe old state of `ManagedRegion`
        lastAnchor <- ST.new $ Nothing @Anchor
        wasLast <- runSTFn2 isLastBound managed children
        lastIx <- ix
        
        -- clear the region so neighbouring `SharedBound`s get hooked up together
        whenM (not <$> runSTFn1 isEmpty managed) do
          anchor <- _.bound =<< ST.read managed.end
          void $ ST.write (Just anchor) lastAnchor
          runSTFn2 clearBound managed children

        -- update `SharedBound` so the extent of the cleared bound does not point at us
        do
          sharedBound <- ST.read managed.end
          whenM ( eq lastIx <$> join ( ST.read sharedBound.extent ) ) do
            previousRegion <- runSTFn2 index ( lastIx - 1 ) children
            void $ ST.write previousRegion.ix sharedBound.extent

        -- now safe to move, indices becoming invalid
        do
          removed <- STArray.splice lastIx (lastIx + 1) [] children
          void $ STArray.splice pos pos removed children

          newBegin <- runSTFn2 shareBound managed.ix children
          void $ ST.write newBegin managed.end

          -- restoring indices
          runSTFn3 fixManaged (min lastIx pos) updateIx children

        -- if we had any elements we signal a bump, this requires the indices to be valid so we do it last
        ST.read lastAnchor >>= traverse_ \anchor -> runSTFn3 bumpBound anchor
          managed
          children

        -- update parent when necessary
        nowLast <- runSTFn2 isLastBound managed children
        when (wasLast /= nowLast) do
          runSTFn2 rebumpLast parentBump children

      remove :: ST.ST Global Unit
      remove = do
        runSTFn1 bump Nothing
        finalIx <- ix
        void $ STArray.splice finalIx (finalIx + 1) [] children
        runSTFn3 fixManaged finalIx updateIx children

    pure $ Region { begin, end, position, sendTo, remove, bump }

index :: forall r a . STFn2 Int ( STArray.STArray r a ) r a
index = mkSTFn2 \ix arr ->
  unsafePartial ( flip Array.unsafeIndex ix <$> STArray.unsafeFreeze arr )

lastRegion :: STFn1 Children Global ManagedRegion
lastRegion = mkSTFn1 \children -> do
  length <- STArray.length children
  -- there is always atleast one element or the parent
  runSTFn2 index ( length - 1 ) children

-- | Reads the end of the previous sibling which is defined as the beginning of the `ManagedRegion`.
beginBound :: STFn2 ManagedRegion Children Global Anchor
beginBound = mkSTFn2 \region children -> do
  ix <- region.ix
  prev <- runSTFn2 index ( ix - 1 ) children
  sbound <- ST.read prev.end
  sbound.bound

-- | Determines the final `Bound` and runs the provided effect on it.
-- | ASSUMES that the last element is not the parent.
rebumpLast :: STFn2 Bump (STArray.STArray Global ManagedRegion) Global Unit
rebumpLast = mkSTFn2 \bump children -> do
  last <- runSTFn1 lastRegion children
  end <- ST.read last.end
  anchor <- end.bound
  runSTFn1 bump $ Just anchor

-- | Uses the bound information to infer if the whole span is empty.
isClear :: STFn1 Children Global Boolean
isClear = mkSTFn1 \children -> do
  last <- runSTFn1 lastRegion children
  end <- ST.read last.end
  owner <- join $ ST.read end.owner
  pure ( owner == 0 ) -- the last element of the span uses the parent as its end so we have no non-empty elements

isEmpty :: STFn1 ManagedRegion Global Boolean
isEmpty = mkSTFn1 \{ ix, end } -> do
  { owner } <- ST.read end
  -- if the `ManagedRegion` does not own its end it's considered empty
  notEq <$> (join $ ST.read owner) <*> ix

-- | Returns whether the `ManagedRegion` controls the ending bound of the whole span.
isLastBound
  :: STFn2 ManagedRegion (STArray.STArray Global ManagedRegion) Global Boolean
isLastBound = mkSTFn2 \region children -> do
  length <- STArray.length children
  end <- ST.read region.end
  owner <- join $ ST.read end.owner
  pos <- region.ix
  extent <- join $ ST.read end.extent
  pure $ owner == pos && extent == length - 1

-- | Creates a new `ShareBound'` value for an empty `ManagedRegion`. It looks up the preceding `ManagedRegion` and uses
-- | its end `SharedBound` possibly extending it.
shareBound
  :: STFn2 (ST.ST Global Int) (STArray.STArray Global ManagedRegion) Global
       SharedBound'
shareBound = mkSTFn2 \posRef children -> do
  pos <- posRef
  -- prev should always be present, shareBound is called with an actual child element and the first element is the
  -- always the parentRegion
  prev <- runSTFn2 index (pos - 1) children
  endFromPrev <- ST.read prev.end
  currentExtent <- join $ ST.read endFromPrev.extent

  -- If the currentExtent is equal or greater to our pos then the region will be inserted before the end of the
  -- `SharedBound` and we dont have to anything.
  -- otherwise we are getting inserted at the end of the `SharedBound` so we set it up to track our position 
  when (currentExtent < pos) do
    void $ ST.write posRef endFromPrev.extent

  pure endFromPrev

-- | Lifts a `ManagedRegion` out of the `RegionSpan`, restoring the `SharedBound`s of its siblings.
clearBound
  :: STFn2 ManagedRegion (STArray.STArray Global ManagedRegion) Global Unit
clearBound = mkSTFn2 \cleared children -> do
  nextBound <- ST.read cleared.end
  selfIx <- cleared.ix
  prevBound <- ST.read <<< _.end =<< runSTFn2 index ( selfIx - 1 ) children

  extentToEff <- ST.read nextBound.extent
  extentToIx <- extentToEff
  ownerEff <- ST.read prevBound.owner
  ownerIx <- ownerEff

  -- choose the smaller `SharedBound` to update, but never update the first element, the parent
  if selfIx - ownerIx > extentToIx - selfIx || ownerIx == 0 then do
    -- the following owned `SharedBound` was smaller, so we extend prevBound to cover nextBound and update the following 
    -- regions
    void $ ST.write extentToEff prevBound.extent
    runSTFn4 fixManagedTo selfIx extentToIx (updateShared prevBound)
      children

  else do
    -- the preceding not owned `SharedBound` was smaller, update the nextBound with the information of
    -- prevBound and update the preceding `ManagedRegion`s
    anchor <- prevBound.bound
    runSTFn1 nextBound.pushAnchor anchor
    void $ ST.write ownerEff nextBound.owner

    runSTFn4 fixManagedTo ownerIx (selfIx + 1) (updateShared nextBound) children

-- | Updates the end of a `ManagedRegion`. If it shares that bound with a preceding sibling it will set up a new
-- | `SharedBound` that it owns and propagates it to all following members of the old `SharedBound`. 
-- | Or it hijacks the previous `SharedBound`. 
bumpBound
  :: STFn3 Anchor ManagedRegion (STArray.STArray Global ManagedRegion) Global
       Unit
bumpBound = mkSTFn3 \anchor bumped children -> do
  empty <- runSTFn1 isEmpty bumped
  -- update our owned `SharedBound`
  if not empty then do
    ownedBound <- ST.read bumped.end
    runSTFn1 ownedBound.pushAnchor anchor

  -- we need to split up the `SharedBound` 
  else do
    prevExtent <- ST.read bumped.end
    ownerEff <- ST.read prevExtent.owner
    ownerIx <- ownerEff

    extentToEff <- ST.read prevExtent.extent
    extentToIx <- extentToEff
    selfIx <- bumped.ix

    previousRegion <- runSTFn2 index (selfIx - 1) children

    -- find the smallest possible update, but never update the first element, the parent
    if selfIx - ownerIx > extentToIx - selfIx || ownerIx == 0 then do
      -- the following `SharedBound` will be smaller
      newShared <- do
        owner <- ST.new bumped.ix
        extent <- ST.new extentToEff
        ref <- ST.new anchor
        let
          pushAnchor = mkSTFn1 \a -> void $ ST.write a ref 
          bound = ST.read ref
        pure { owner, extent, bound, pushAnchor }

      runSTFn4 fixManagedTo selfIx extentToIx (updateShared newShared)
        children
        
      -- update the extent of the preceding `SharedBound` to the previous `ManagedRegion`
      void $ ST.write previousRegion.ix prevExtent.extent

    else do
      -- preceding `SharedBound` will be smaller
      newShared <- do
        owner <- ST.new ownerEff
        extent <- ST.new previousRegion.ix
        ref <- ST.new =<< prevExtent.bound
        let
          pushAnchor = mkSTFn1 \a -> void $ ST.write a ref 
          bound = ST.read ref
        pure { owner, extent, bound, pushAnchor }

      runSTFn4 fixManagedTo ownerIx (selfIx - 1) (updateShared newShared)
        children

      -- hijack longer prevExtent `SharedBound` and update it with our own info, making bumped the new owner
      void $ ST.write bumped.ix prevExtent.owner
      runSTFn1 prevExtent.pushAnchor anchor

insertManaged
  :: STFn2 (Maybe Int) (STArray.STArray Global ManagedRegion) Global
       ManagedRegion
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
  end <- ST.new prevBegin

  let
    managed :: ManagedRegion
    managed =
      { ix, pushIx, position, end }

  void $ STArray.splice pos pos [ managed ] children

  runSTFn3 fixManaged (pos + 1) updateIx children
  pure managed

updateShared :: SharedBound' -> STFn2 Int ManagedRegion Global Unit
updateShared shared = mkSTFn2 \_ region -> do
  void $ ST.write shared region.end

updateIx :: STFn2 Int ManagedRegion Global Unit
updateIx =
  mkSTFn2 \i { pushIx } -> runSTFn1 pushIx i

-- TODO: expensive operation
fixManaged
  :: STFn3 Int (STFn2 Int ManagedRegion Global Unit)
       (STArray.STArray Global ManagedRegion)
       Global
       Unit
fixManaged = mkSTFn3 \from fn children -> do
  length <- STArray.length children
  runSTFn4 fixManagedTo from length fn children

fixManagedTo
  :: STFn4 Int Int (STFn2 Int ManagedRegion Global Unit)
       (STArray.STArray Global ManagedRegion)
       Global
       Unit
fixManagedTo = mkSTFn4 \from to fn children -> do
  elems <- STArray.unsafeFreeze children
  ST.for from to \ix -> do
    runSTFn2 fn ix (unsafePartial (Array.unsafeIndex elems ix))

newStaticRegion :: STFn2 Bound Bump Global StaticRegion
newStaticRegion = mkSTFn2 \parentBound parentBump -> do
  spanCounter <- ST.new (-1) -- making the first span 0
  spanState <- ST.new $ Nothing @RegionSpan
  staticEnd <- ST.new $ Nothing @Anchor

  let
    findOrCreateSpan :: ST.ST Global RegionSpan
    findOrCreateSpan = ST.read spanState >>= case _ of
      Nothing -> do
        spanIx <- ST.modify (add 1) spanCounter
        staticBegin <- ST.read staticEnd
        let
          begin :: Bound
          begin = fromMaybe <$> parentBound <@> staticBegin

          bump :: Bump
          bump = mkSTFn1 \update -> 
            -- only take control of parentBump when we are the last span
            whenM (eq spanIx <$> ST.read spanCounter) case update of
              Nothing ->
                runSTFn1 parentBump =<< ST.read staticEnd

              b ->
                runSTFn1 parentBump b

        runSTFn2 newSpan begin bump

      Just span ->
        pure span

  pure $ StaticRegion
    { end: fromMaybe <$> parentBound <*> ST.read staticEnd
    , region: do
        RegionSpan span <- findOrCreateSpan
        runSTFn1 span Nothing

    , element: mkSTFn1 \anchor -> do
        whenM (isJust <$> ST.read spanState) do
          -- clear span state
          void $ ST.write Nothing spanState
          -- signal that any previous span is no longer allowed to use parentBump
          void $ ST.modify (add 1) spanCounter

        void $ ST.write ( Just anchor ) staticEnd
        runSTFn1 parentBump $ Just anchor
    }

fromParent :: STFn1 DekuParent Global StaticRegion
fromParent =
  mkSTFn1 \parent -> runSTFn2 newStaticRegion (pure $ ParentStart parent)
    (mkSTFn1 \_ -> pure unit)
