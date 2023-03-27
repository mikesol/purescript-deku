-- | Deku Hooks, modeled after React Hooks, are a way to have stateful behavior in Deku.
-- | At a basic level, Deku hooks look very much like their react counterparts:
-- |
-- | ```purescript
-- | Deku.do
-- |  setCount /\ count <- useState 0
-- |  Deku.button (click $ counter <#> add 1 >>> setCount) [ text (show count) ]
-- | ```
-- |
-- | Deku hooks are covered more extensively in the
-- | [Deku guide section on state](https://purescript-deku.netlify.app/core-concepts/state)
-- | and the [Deku guide section on collections](https://purescript-deku.netlify.app/core-concepts/collections).
module Deku.Hooks
  ( useState'
  , useState
  , useRef
  , useMemoized'
  , useMemoized
  , useMailboxed
  , useEffect
  , useAff
  , useAffWithCancellation
  , useHot
  , useHot'
  , useDyn
  , useDyn_
  ) where

import Prelude

import Bolson.Core (Child, envy)
import Control.Alt ((<|>))
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Internal as STRef
import Control.Monad.ST.Uncurried (mkSTFn1, mkSTFn2, runSTFn1, runSTFn2)
import Data.Foldable (for_)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Tuple (curry)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Core (Domable(..), Node, bus, bussedUncurried, insert, remove, sendToPos)
import Deku.Do as Deku
import Effect (Effect)
import Effect.Aff (Aff, error, killFiber, launchAff, launchAff_)
import Effect.Uncurried (mkEffectFn1, runEffectFn1, runEffectFn2)
import FRP.Event (Event, Subscriber(..), createPure, keepLatest, mailboxed, makeEventO, makeLemmingEvent, makeLemmingEventO, memoize, subscribeO)
import Safe.Coerce (coerce)

-- | A state hook for states without initial values. See [`useState'`](https://purescript-deku.netlify.app/core-concepts/state#state-without-initial-values) in the Deku guide for example usage.
useState'
  :: forall payload a
   . ( ((a -> Effect Unit) /\ Event a)
       -> Domable payload
     )
  -> Domable payload
useState' = bussedUncurried

-- | A hook to work with memoized values. See [`useMemoized`](https://purescript-deku.netlify.app/core-concepts/more-hooks#the-case-for-memoization) in the Deku guide for example usage.
useMemoized
  :: forall payload a
   . (Event a)
  -> (Event a -> Domable payload)
  -> Domable payload
useMemoized e f1 = Domable $ envy
  (coerce (memoize e f1))

-- | A hook to work with memoized values that lack an initial value. See [`useMemoized'`](https://purescript-deku.netlify.app/core-concepts/more-hooks#memoizing-without-an-initial-event) in the Deku guid for example usage.
useMemoized'
  :: forall payload a b
   . (Event a -> Event b)
  -> ( ((a -> Effect Unit) /\ Event b)
       -> Domable payload
     )
  -> Domable payload
useMemoized' f0 f1 = bussedUncurried \(a /\ b) -> Domable $ envy
  (coerce (memoize (f0 b) \c -> f1 (a /\ c)))

-- | A state hook. See [`useState`](https://purescript-deku.netlify.app/core-concepts/state#the-state-hook) in the Deku guide for example usage.
useState
  :: forall payload a
   . a
  -> ( ((a -> Effect Unit) /\ Event a)
       -> Domable payload
     )
  -> Domable payload
useState a f = Deku.do
  x /\ y <- useState'
  m <- useMemoized (y <|> pure a)
  f (x /\ m)

-- | A hook that takes an initial value and an event and produces
-- | a reference to the value that can be used in listeners. While the value
-- | itself is mutable, it cannot be changed by the consumer of the ref.
useRef
  :: forall payload a
   . a
  -> Event a
  -> ( Effect a
       -> Domable payload
     )
  -> Domable payload
useRef a e f = Domable $ envy $ coerce $ makeLemmingEvent \s k -> do
  r <- STRef.new a
  k $ f (liftST $ STRef.read r)
  s e \i -> void $ STRef.write i r

-- | A hook that provides an event creator instead of events. Event creators turn into events when
-- | given an address, at which point they listen for a payload. This is useful when listening to
-- | large domains like updates of single items over large lists. It runs in _O(log n)_ time.
-- | For example usage, see [`useMailboxed`](https://purescript-deku.netlify.app/core-concepts/more-hooks#use-mailboxed) in the Deku guide.
useMailboxed
  :: forall payload a b
   . Ord a
  => ( ( ({ address :: a, payload :: b } -> Effect Unit) /\
           (a -> Event b)
       )
       -> Domable payload
     )
  -> Domable payload
useMailboxed f = bussedUncurried \(a /\ b) -> Domable $ envy
  (coerce (mailboxed b \c -> f (a /\ c)))

-- | A hook to create dynamic collections like one would find in a contact list or todo mvc.
-- | See [`useDyn`](https://purescript-deku.netlify.app/core-concepts/collections#dynamic-components) in the Deku guide for example usage.
useDyn
  :: forall payload
   . Int
  -> ( { remove :: Effect Unit, sendTo :: Int -> Effect Unit }
       -> Domable payload
     )
  -> Event (Child Int (Node payload))
useDyn i f = keepLatest Deku.do
  setChildLogic /\ childLogic <- bus <<< curry
  pure
    ( insert i
        ( f
            { remove: setChildLogic remove
            , sendTo: setChildLogic <<< sendToPos
            }
        )
    ) <|> childLogic

-- | A version of `useDyn` that uses `0` as the initial position for a dynamic element.
useDyn_
  :: forall payload
   . ( { remove :: Effect Unit, sendTo :: Int -> Effect Unit }
       -> Domable payload
     )
  -> Event (Child Int (Node payload))
useDyn_ = useDyn 0

-- | A hook that remembers its most recent value and plays it back upon subscription _without_ an initial value. See [`useHot'`](https://purescript-deku.netlify.app/core-concepts/state#memoization-and-usehot) in the Deku guide for more info.
useHot'
  :: forall payload a. ((a -> Effect Unit) /\ Event a -> Domable payload) -> Domable payload
useHot' f = Domable $ envy $ makeLemmingEventO
  ( mkSTFn2 \(Subscriber s) k -> do
      { push, event } <- createPure
      current <- STRef.new Nothing
      let writeVal v = STRef.write (Just v) current
      let
        push'' i = liftST do
          _ <- writeVal i
          push i
      -- push' i = do
      --   _ <- writeVal i
      --   push i
      let
        event' = makeLemmingEventO
          ( mkSTFn2 \_ k' -> do
              val <- STRef.read current
              for_ val \x -> runSTFn1 k' x
              runSTFn2 s event k'
          )
      runSTFn1 k ((\(Domable x) -> x) (f (push'' /\ event')))
      runSTFn2 s event (mkSTFn1 \v -> void $ writeVal v)
  )

-- | A hook that remembers its most recent value and plays it back upon subscription. See [`useHot`](https://purescript-deku.netlify.app/core-concepts/state#memoization-and-usehot) in the Deku guide for more info.
useHot
  :: forall payload a
   . a
  -> ((a -> Effect Unit) /\ Event a -> Domable payload)
  -> Domable payload
useHot a f = Domable $ envy $ makeLemmingEventO
  ( mkSTFn2 \(Subscriber s) k -> do
      { push, event } <- createPure
      current <- STRef.new Nothing
      let writeVal v = STRef.write (Just v) current
      let
        push'' i = liftST do
          _ <- writeVal i
          push i
      -- push' i = do
      --   _ <- writeVal i
      --   push i
      let
        event' = makeLemmingEventO
          ( mkSTFn2 \_ k' -> do
              val <- STRef.read current
              runSTFn1 k' (fromMaybe a val)
              runSTFn2 s event k'
          )
      runSTFn1 k ((\(Domable x) -> x) (f (push'' /\ event')))
      runSTFn2 s event (mkSTFn1 \v -> void $ writeVal v)
  )

-- | A hook that runs an arbitrary effect when an event's value changes.
useEffect
  :: forall payload a
   . Event a
  -> (a -> Effect Unit)
  -> (Unit -> Domable payload)
  -> Domable payload
useEffect e f1 f2 = Domable $ envy $ coerce $ makeEventO $ mkEffectFn1 \k -> do
  runEffectFn1 k (f2 unit)
  runEffectFn2 subscribeO e $ mkEffectFn1 f1

-- | A hook that runs an arbitrary aff when an event's value changes.
useAff
  :: forall payload a
   . Event a
  -> (a -> Aff Unit)
  -> (Unit -> Domable payload)
  -> Domable payload
useAff e = useEffect e <<< map launchAff_

-- | A hook that runs an arbitrary aff when an event's value changes, cancelling the previous aff.
useAffWithCancellation
  :: forall payload a
   . Event a
  -> (a -> Aff Unit)
  -> (Unit -> Domable payload)
  -> Domable payload
useAffWithCancellation e f1 f2 = Domable $ envy $ coerce $ makeEventO $ mkEffectFn1 \k -> do
  r <- liftST $ STRef.new (pure unit)
  runEffectFn1 k (f2 unit)
  runEffectFn2 subscribeO e $ mkEffectFn1 \a -> do
    r' <- liftST $ STRef.read r
    r'' <- launchAff do
      killFiber (error "useAffWithCancellation") r'
      f1 a
    liftST $ void $ STRef.write r'' r
