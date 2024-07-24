-- | `Region`s are used to figure out the bounds of collections of managed elements. The difficulty lies mostly in empty
-- | managed regions, they have nothing to get a hold of and need to be managed outside of the DOM. To communicate the
-- | presence or absence of elements, `Region`s have to use `Bump Just` to signal to their parents that they contain an
-- | element that can be used to locate a region or `Bump Nothing` to signal that it contains no elements to locate.
-- |
-- | It is then the responsibilty of the parent to use the information of all its children to provide correct `Bound`
-- | information to i.e. `DOMInterpret` to use `attachElement` or `beamRegion`. A `Bump Just` causes all following
-- | `Region`s to update their begin(and their end when empty) until a new non-empty region is found. A `Bump Nothing`
-- | causes the inverse. First a non-empty `Region` has be found which will be used to update the beginning of all
-- | following empty `Region`s until a new non-empty `Region` is found.
module Deku.Internal.Region
  ( Anchor(..)
  , Bound
  , Region(..)
  , StaticRegion(..)
  , RegionSpan
  , Bump
  , fromParent
  , newStaticRegion
  , newSpan
  , allocateRegion
  , printSpan
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
import Data.Maybe (Maybe(..), isJust, maybe)
import Data.Newtype (class Newtype)
import Deku.Internal.Entities (DekuElement, DekuParent, DekuText)
import FRP.Event (createPure)
import FRP.Poll (Poll, pollFromEvent, stRefToPoll)
import Partial.Unsafe (unsafePartial)

data Anchor
  = ParentStart DekuParent
  | Element DekuElement
  | Text DekuText

-- | Hides how the `Anchor` is determined. Typically a region needs to check if it has any elements of its own and
-- | defers to the parent when it has none. Otherwise we just return the last element of the region.
type Bound =
  ST.ST Global Anchor

-- | Signals to the parent that the endpoint of the region has changed. This can cascade up a tree of regions when the
-- | child region was the last one or the parent is now empty.
type Bump =
  STFn1 (Maybe Anchor) Global Unit

-- | A dynamic `Region` that supports moving, removing, appending and clearing.
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

-- | Contains information about which regions in a span
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

-- | The core of the Region system are RegionSpans. They manage sibling Regions and coordinate the insert, bump, move
-- | and remove actions. They also provide a Bound implementation which lets Regions determine their begin and end
-- | Anchors for beamRegion. The actual structure of the RegionSpan is just an array of regions. All regions track their
-- | indices by using a reference that gets updated on every insert/splice.
-- |
-- | The begin of a Region is defined as the end of the previous region. A dummy region is inserted at the start which
-- | contains the information provided by the parent. This makes the whole ix - 1 dance work out but we will have to
-- | correct the indices for this at some points(see insertManaged and newSpan->sendTo).
-- |
-- | The end of a region is stored in a SharedBound. As the name suggests this bound can be shared among multiple
-- | adjacent regions. The end is set by region pointed to by the owner field. All following empty regions use the same
-- | SharedBound. The last region using the SharedBound is pointed to by the extent field.
-- |
-- | For a non-empty regions this works out to: begin is the end of the previous region, if it is empty this does not
-- | matter because we read the end of the first non-empty region which is shared with the empty one.
-- |
-- | For an empty region we do the same, we find the end of the first non-empty region, read our own end which would be
-- | the same SharedBound leading to the begin and end pointing to the same Node signalling an empty collection to
-- | beamRegion.
-- |
-- | To split a SharedBound we can use the owner and extent pointer to find all empty regions using that bound. Then we
-- | create a new SharedBound and update all following regions.
-- |
-- | The inverse happens when the region signals a clear. The we extend the preceding SharedBound and update the
-- | following regions.
-- |
-- | The implementation detects if updating the preceding or following regions would be cheaper and uses that strategy.
newtype RegionSpan =
  RegionSpan
    { children :: Children
    , bump :: Bump
    }

-- | Manages a span of `Region`s. 
newSpan :: STFn2 Bound Bump Global RegionSpan
newSpan = mkSTFn2 \parent parentBump -> do
  children <- STArray.new

  -- bound owned by an element outside of this span
  parentBound <- do
    owner <- ST.new $ pure 0
    extent <- ST.new $ pure 0
    let
      -- we cant actually update the beginning given from the parent, so this dummy has to do
      -- `bumpBound` and `clearBound` have safeguards to never call this effect
      pushAnchor :: STFn1 Anchor Global Unit
      pushAnchor =
        mkSTFn1 \_ -> pure unit -- unsafeThrow "parent forced to update anchor"

    ST.new { owner, extent, bound: parent, pushAnchor }

  let
    parentRegion :: ManagedRegion
    parentRegion =
      { ix: pure 0
      , pushIx: mkSTFn1 \_ -> pure unit -- unsafeThrow "parent forced to update index"
      , position: empty
      , end: parentBound
      }
  void $ STArray.push parentRegion children
  pure $ RegionSpan { children, bump: parentBump }

printSpan :: STFn1 RegionSpan Global String
printSpan = mkSTFn1 \(RegionSpan { children }) -> do
  arr <- STArray.freeze children
  owner <- Array.foldM
    (\a r -> append a <<< show <$> join (ST.read <<< _.owner =<< ST.read r.end))
    ""
    arr
  extent <- Array.foldM
    ( \a r -> append a <<< show <$> join
        (ST.read <<< _.extent =<< ST.read r.end)
    )
    ""
    arr
  pure $ owner <> "\n" <> extent

allocateRegion :: STFn2 (Maybe Int) RegionSpan Global Region
allocateRegion = mkSTFn2
  \givenPos span@(RegionSpan { children, bump: parentBump }) -> do
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
          wasLast <- runSTFn2 isLastBound managed children
          runSTFn2 clearBound managed children
          runSTFn3 updateParent wasLast managed span

        b@(Just anchor) -> do
          runSTFn3 bumpBound anchor managed children
          whenM (runSTFn2 isLastBound managed children) do
            runSTFn1 parentBump b

      sendTo :: STFn1 Int Global Unit
      sendTo = mkSTFn1 \pos' -> do
        let
          -- correct shift by parent `SharedBound`
          pos :: Int
          pos =
            pos' + 1

        -- save old state of `ManagedRegion`
        lastAnchor <- ST.new $ Nothing @Anchor
        wasLast <- runSTFn2 isLastBound managed children
        lastIx <- ix

        -- clear the region so neighbouring `SharedBound`s coalesce
        whenM (not <$> runSTFn1 isEmpty managed) do
          anchor <- _.bound =<< ST.read managed.end
          void $ ST.write (Just anchor) lastAnchor
          runSTFn2 clearBound managed children

        -- update `SharedBound` so the extent of the cleared bound does not point at us
        do
          sharedBound <- ST.read managed.end
          whenM (eq lastIx <$> join (ST.read sharedBound.extent)) do
            previousRegion <- runSTFn2 index (lastIx - 1) children
            void $ ST.write previousRegion.ix sharedBound.extent

        -- now safe to move, indices becoming invalid
        do
          removed <- STArray.splice lastIx 1 [] children
          void $ STArray.splice pos 0 removed children

          -- restoring indices
          runSTFn3 fixManaged (min lastIx pos) updateIx children
          newBegin <- runSTFn2 shareBound managed.ix children
          void $ ST.write newBegin managed.end

        -- if we had any elements we signal a bump, this requires the indices to be valid so we do it last
        ST.read lastAnchor >>= traverse_ \anchor -> runSTFn3 bumpBound anchor
          managed
          children

        -- update parent when necessary
        runSTFn3 updateParent wasLast managed span

      remove :: ST.ST Global Unit
      remove = do
        runSTFn1 bump Nothing
        finalIx <- ix
        -- give ourselves an invalid index so later sendTo and removes have no effect
        runSTFn1 managed.pushIx (-1)
        void $ STArray.splice finalIx 1 [] children
        runSTFn3 fixManaged finalIx updateIx children

    pure $ Region { begin, end, position, sendTo, remove, bump }

index :: forall r a. STFn2 Int (STArray.STArray r a) r a
index = mkSTFn2 \ix arr ->
  unsafePartial (flip Array.unsafeIndex ix <$> STArray.unsafeFreeze arr)

lastRegion :: STFn1 Children Global ManagedRegion
lastRegion = mkSTFn1 \children -> do
  length <- STArray.length children
  -- there is always atleast one element or the parent
  runSTFn2 index (length - 1) children

-- | Reads the end of the previous sibling which is defined as the beginning of the `ManagedRegion`.
beginBound :: STFn2 ManagedRegion Children Global Anchor
beginBound = mkSTFn2 \region children -> do
  ix <- region.ix
  prev <- runSTFn2 index (ix - 1) children
  sbound <- ST.read prev.end
  sbound.bound

-- | Determines the whether the final `Bound`, determines the final `Bound` and runs the `Bump` effect on it.
updateParent :: STFn3 Boolean ManagedRegion RegionSpan Global Unit
updateParent = mkSTFn3 \wasLast managed (RegionSpan { bump, children }) -> do
  nowLast <- runSTFn2 isLastBound managed children
  when (wasLast /= nowLast) do
    last <- runSTFn1 lastRegion children
    end <- ST.read last.end
    ownerIx <- join $ ST.read end.owner
    if ownerIx == 0 then
      runSTFn1 bump Nothing
    else do
      anchor <- end.bound
      runSTFn1 bump $ Just anchor

isEmpty :: STFn1 ManagedRegion Global Boolean
isEmpty = mkSTFn1 \{ ix, end } -> do
  { owner } <- ST.read end
  -- if the `ManagedRegion` does not own its end it's considered empty
  notEq <$> (join $ ST.read owner) <*> ix

-- | Returns whether the given `ManagedRegion` controls the ending bound of the whole span.
isLastBound
  :: STFn2 ManagedRegion Children Global Boolean
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
  :: STFn2 (ST.ST Global Int) Children Global
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
  :: STFn2 ManagedRegion Children Global Unit
clearBound = mkSTFn2 \cleared children -> do
  nextBound <- ST.read cleared.end
  selfIx <- cleared.ix
  prevBound <- ST.read <<< _.end =<< runSTFn2 index (selfIx - 1) children

  extentToEff <- ST.read nextBound.extent
  extentToIx <- extentToEff
  ownerEff <- ST.read prevBound.owner
  ownerIx <- ownerEff

  -- choose the smaller `SharedBound` to update, but never update the first element, the parent
  if selfIx - ownerIx > extentToIx - selfIx || ownerIx == 0 then do
    -- the following owned `SharedBound` was smaller, so we extend prevBound to cover nextBound and update the following 
    -- regions
    void $ ST.write extentToEff prevBound.extent
    runSTFn4 fixManagedTo selfIx (extentToIx + 1) (updateShared prevBound)
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
  :: STFn3 Anchor ManagedRegion Children Global
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

      runSTFn4 fixManagedTo selfIx (extentToIx + 1) (updateShared newShared)
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

      runSTFn4 fixManagedTo ownerIx selfIx (updateShared newShared)
        children

      -- hijack longer prevExtent `SharedBound` and update it with our own info, making bumped the new owner
      void $ ST.write bumped.ix prevExtent.owner
      runSTFn1 prevExtent.pushAnchor anchor

insertManaged
  :: STFn2 (Maybe Int) Children Global
       ManagedRegion
insertManaged = mkSTFn2 \givenPos children -> do
  length <- STArray.length children
  let
    -- clamp and correct the givenPos, because the parent `SharedBound` already occupies the first element and shifts
    -- everything else by one
    pos :: Int
    pos =
      clamp 1 length $ maybe length (add 1) givenPos

  ixRef <- ST.new pos
  posEvent <- createPure

  let
    pushIx :: STFn1 Int Global Unit
    pushIx = mkSTFn1 \i -> do
      void $ ST.write i ixRef
      posEvent.push $ i - 1 -- and restore position for the user

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

  void $ STArray.splice pos 0 [ managed ] children
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
       Children
       Global
       Unit
fixManaged = mkSTFn3 \from fn children -> do
  length <- STArray.length children
  runSTFn4 fixManagedTo from length fn children

-- TODO: expensive operation
fixManagedTo
  :: STFn4 Int Int (STFn2 Int ManagedRegion Global Unit)
       Children
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
  spanEnd <- ST.new $ Nothing @Anchor

  let
    findOrCreateSpan :: ST.ST Global RegionSpan
    findOrCreateSpan = ST.read spanState >>= case _ of
      Nothing -> do
        spanIx <- ST.modify (add 1) spanCounter
        staticBegin <- ST.read staticEnd
        let
          begin :: Bound
          begin = do
            case staticBegin of
              Just e -> pure e
              Nothing -> parentBound

          bump :: Bump
          bump = mkSTFn1 \update ->
            -- only take control of parentBump when we are the last span
            whenM (eq spanIx <$> ST.read spanCounter) do
              void $ ST.write update spanEnd
              case update of
                Nothing ->
                  runSTFn1 parentBump =<< ST.read staticEnd

                b ->
                  runSTFn1 parentBump b

        span <- runSTFn2 newSpan begin bump
        void $ ST.write (Just span) spanState
        pure span

      Just span ->
        pure span

  pure $ StaticRegion
    { end: do
        fromSpan <- ST.read spanEnd
        case fromSpan of
          Just e ->
            pure e

          Nothing -> do
            fromStatic <- ST.read staticEnd
            case fromStatic of
              Just e ->
                pure e

              Nothing ->
                parentBound

    , region: do
        span <- findOrCreateSpan
        runSTFn2 allocateRegion Nothing span

    , element: mkSTFn1 \anchor -> do
        whenM (isJust <$> ST.read spanState) do
          -- clear span state
          void $ ST.write Nothing spanState
          void $ ST.write Nothing spanEnd
          -- signal that any previous span is no longer allowed to use parentBump
          void $ ST.modify (add 1) spanCounter

        void $ ST.write (Just anchor) staticEnd
        runSTFn1 parentBump $ Just anchor
    }

fromParent :: STFn1 DekuParent Global StaticRegion
fromParent =
  mkSTFn1 \parent -> runSTFn2 newStaticRegion (pure $ ParentStart parent)
    (mkSTFn1 \_ -> pure unit)
