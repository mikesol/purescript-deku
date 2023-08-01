-- | Deku Hooks, modeled after React Hooks, are a way to have stateful behavior in Deku.
-- | At a basic level, Deku hooks look very much like their react counterparts:
-- |
-- | ```purescript
-- | Deku.do
-- |  setCount /\ count <- useState 0
-- |  Deku.button (click' $ counter <#> add 1 >>> setCount) [ textShow' count ]
-- | ```
-- |
-- | Deku hooks are covered more extensively in the
-- | [Deku guide section on state](https://purescript-deku.netlify.app/core-concepts/state)
-- | and the [Deku guide section on collections](https://purescript-deku.netlify.app/core-concepts/collections).
module Deku.Hooks
  ( (<##~>)
  , (<#~>)
  , (<$$~>)
  , (<$~>)
  , dynOptions
  , switcher
  , switcherFlipped
  , switcherWithInitialValue
  , switcherWithInitialValueFlipped
  , useDyn
  , useDynAtBeginning
  , useDynAtBeginningWith
  , useDynAtBeginningWith_
  , useDynAtBeginning_
  , useDynAtEnd
  , useDynAtEndWith
  , useDynAtEndWith_
  , useDynAtEnd_
  , useDynWith
  , useDynWith_
  , useDyn_
  , useMailboxed
  , useMemoized
  , useMemoized'
  , useRef
  , useState
  , useState'
  , useStateWithRef
  ) where

import Prelude

import Bolson.Control (Flatten)
import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..))
import Bolson.Core as BCore
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Internal as STRef
import Control.Plus (empty)
import Data.Array as Array
import Data.FunctorWithIndex (mapWithIndex)
import Data.Maybe (Maybe(..))
import Data.Newtype (unwrap)
import Data.NonEmpty (NonEmpty(..), tail)
import Data.Tuple (Tuple(..), snd)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Core (Child(..), DOMInterpret(..), DekuExtra, Hook, Node(..), Node', Nut(..), NutF(..), dyn, remove, sendToPos, unsafeSetPos)
import Deku.Do as Deku
import Effect (Effect)
import FRP.Event (Event, create, filterMap, mailbox, makeEvent, mapAccum, merge, subscribe)

flattenArgs
  :: forall payload. Flatten Int (DOMInterpret payload) Node DekuExtra payload
flattenArgs =
  { doLogic: \pos (DOMInterpret { sendToPos }) id -> sendToPos { id, pos }
  , ids: unwrap >>> _.ids
  , deferPayload: \(DOMInterpret { deferPayload }) -> deferPayload
  , forcePayload: \(DOMInterpret { forcePayload }) -> forcePayload
  , redecorateDeferredPayload: \(DOMInterpret { redecorateDeferredPayload }) ->
      redecorateDeferredPayload
  , disconnectElement:
      \(DOMInterpret { disconnectElement }) { id, scope, parent } ->
        disconnectElement { id, scope, parent, scopeEq: eq }
  , toElt: \(Node e) -> e
  }

__internalDekuFlatten
  :: forall payload
   . NutF payload
  -> Node' payload
__internalDekuFlatten (NutF c) a b = Bolson.flatten flattenArgs a b c

-- | A state hook. See [`useState`](https://purescript-deku.netlify.app/core-concepts/state#the-state-hook) in the Deku guide for example usage.
useState'
  :: forall a
   . Hook ((a -> Effect Unit) /\ Event a)
useState' f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = do
    { event, push } <- create
    let Nut nf = f (push /\ event)
    __internalDekuFlatten nf i di

-- | A state hook. See [`useState`](https://purescript-deku.netlify.app/core-concepts/state#the-state-hook) in the Deku guide for example usage.
useState
  :: forall a
   . a
  -> Hook ((a -> Effect Unit) /\ NonEmpty Event a)
useState a f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = do
    { event, push } <- create
    let Nut nf = f (push /\ NonEmpty a event)
    __internalDekuFlatten nf i di

-- | A hook to work with memoized values. See [`useMemoized`](https://purescript-deku.netlify.app/core-concepts/more-hooks#the-case-for-memoization) in the Deku guide for example usage.
useMemoized
  :: forall a
   . Event a
  -> Hook (Event a)
useMemoized e f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = do
    { event, push } <- create
    u <- subscribe e push
    let Nut nf = f event
    Tuple sub (Tuple unsub evt) <- __internalDekuFlatten nf i di
    pure $ Tuple sub $ Tuple unsub $ makeEvent \k -> do
      o <- subscribe evt k
      pure do
        u
        o

-- | A hook to work with memoized values that lack an initial value. See [`useMemoized'`](https://purescript-deku.netlify.app/core-concepts/more-hooks#memoizing-without-an-initial-event) in the Deku guid for example usage.
useMemoized'
  :: forall a b
   . (Event a -> Event b)
  -> Hook ((a -> Effect Unit) /\ Event b)
useMemoized' f0 makeHook = Deku.do
  push /\ e <- useState'
  m <- useMemoized (f0 e)
  makeHook (push /\ m)

-- | A hook that takes an initial value and an event and produces
-- | a reference to the value that can be used in listeners. While the value
-- | itself is mutable, it cannot be changed by the consumer of the ref.
useRef
  :: forall a
   . a
  -> Event a
  -> Hook (Effect a)
useRef a e makeHook = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = do
    rf <- STRef.new a
    let Nut nf = makeHook (liftST $ STRef.read rf)
    Tuple sub (Tuple unsub evt) <- __internalDekuFlatten nf i di
    pure $ Tuple sub $ Tuple unsub $ makeEvent \k -> do
      u0 <- subscribe e \x -> do
        void $ liftST $ STRef.write x rf
      u1 <- subscribe evt k
      pure do
        u0
        u1

useStateWithRef
  :: forall a
   . a
  -> Hook (Effect a /\ (a -> Effect Unit) /\ NonEmpty Event a)
useStateWithRef a f = Deku.do
  push /\ e <- useState a
  ref <- useRef a (tail e)
  f (ref /\ push /\ e)

-- | A hook that provides an event creator instead of events. Event creators turn into events when
-- | given an address, at which point they listen for a payload. This is useful when listening to
-- | large domains like updates of single items over large lists. It runs in _O(log n)_ time.
-- | For example usage, see [`useMailboxed`](https://purescript-deku.netlify.app/core-concepts/more-hooks#use-mailboxed) in the Deku guide.
useMailboxed
  :: forall a b
   . Ord a
  => Hook (({ address :: a, payload :: b } -> Effect Unit) /\ (a -> Event b))
useMailboxed f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = do
    { event, push } <- mailbox
    let Nut nf = f (push /\ event)
    __internalDekuFlatten nf i di

type DynOptions v =
  { sendTo :: v -> Event Int, remove :: v -> Event Unit }

dynOptions :: forall v. DynOptions v
dynOptions = { sendTo: const empty, remove: const empty }

useDyn
  :: forall value
   . Array (Tuple Int value)
  -> Event (Tuple Int value)
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDyn x y = useDynWith x y dynOptions

useDynWith
  :: forall value
   . Array (Tuple Int value)
  -> Event (Tuple Int value)
  -> DynOptions value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynWith arr e opts f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = do
    let
      mc cx (Tuple pos v) = Tuple
        ( merge
            [ opts.remove v $> Child BCore.Remove
            , Child <<< BCore.Logic <$> opts.sendTo v
            , cx.event
            ]
        )
        ( unsafeSetPos pos $ f
            { value: v
            , remove: cx.push remove
            , sendTo: cx.push <<< sendToPos
            }
        )
    c0 <- create
    c1 <- create
    let
      Nut nf = dyn $ Tuple (map (mc c0) arr) $ map (mc c1) e
    __internalDekuFlatten nf i di

useDynAtBeginningWith
  :: forall value
   . Array value
  -> Event value
  -> DynOptions value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtBeginningWith a e = useDynWith ((0 /\ _) <$> a) ((0 /\ _) <$> e)

useDynAtBeginning
  :: forall value
   . Array value
  -> Event value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtBeginning a b = useDynAtBeginningWith a b dynOptions

useDynAtEndWith
  :: forall value
   . Array value
  -> Event value
  -> DynOptions value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtEndWith arr e = useDynWith (mapWithIndex Tuple arr)
  (mapAccum (\a b -> (a + 1) /\ (a /\ b)) (Array.length arr) e)

useDynAtEnd
  :: forall value
   . Array value
  -> Event value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtEnd a b = useDynAtEndWith a b dynOptions

-- -- | Like `bindFlipped`, except instead of working with a monad, it dipts into an `Event`
-- -- | and creates a `Nut`. This allows you to use an event to switch between different
-- -- | bits of DOM. This is how a [Virtual DOM](https://en.wikipedia.org/wiki/Virtual_DOM) works
-- -- | in its most basic, unoptimized form. As a result, `switcher`, while convenient, is inefficient
-- -- | and should be used when the content needs to be replaced wholesale. For a more efficient
-- -- | approach, see the `useDyn` hook.
switcher
  :: forall a
   . (a -> Nut)
  -> Event a
  -> Nut
switcher f event = Deku.do
  ctr <- useMemoized (counter event)
  { value } <- useDynAtBeginningWith_ ctr $ dynOptions
    { remove = \(Tuple oldV _) -> filterMap
        (\(Tuple newV _) -> if newV == oldV + 1 then Just unit else Nothing)
        ctr
    }
  f (snd value)
  where
  counter = mapAccum fn 0
    where
    fn a b = (a + 1) /\ (a /\ b)

infixl 4 switcher as <$~>

-- | A version of switcher that produces an initial value when `Nothing` is passed in.
switcherWithInitialValue
  :: forall a
   . (a -> Nut)
  -> NonEmpty Event a
  -> Nut
switcherWithInitialValue f (NonEmpty h event) = Deku.do
  ctr <- useMemoized (counter event)
  { value } <- useDynAtBeginningWith [ Tuple 0 h ] ctr $
    dynOptions
      { remove = \(Tuple oldV _) -> filterMap
          (\(Tuple newV _) -> if newV == oldV + 1 then Just unit else Nothing)
          ctr
      }
  f (snd value)
  where
  counter = mapAccum fn 1
    where
    fn a b = (a + 1) /\ (a /\ b)

infixl 4 switcherWithInitialValue as <$$~>

-- | A flipped version of `switcher`.
switcherFlipped
  :: forall a
   . Event a
  -> (a -> Nut)
  -> Nut
switcherFlipped = flip switcher

infixl 1 switcherFlipped as <#~>

switcherWithInitialValueFlipped
  :: forall a
   . NonEmpty Event a
  -> (a -> Nut)
  -> Nut
switcherWithInitialValueFlipped = flip switcherWithInitialValue

infixl 1 switcherWithInitialValueFlipped as <##~>

useDyn_
  :: forall value
   . Event (Tuple Int value)
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDyn_ = useDyn []

useDynWith_
  :: forall value
   . Event (Tuple Int value)
  -> DynOptions value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynWith_ = useDynWith []

useDynAtBeginning_
  :: forall value
   . Event value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtBeginning_ = useDynAtBeginning []

useDynAtBeginningWith_
  :: forall value
   . Event value
  -> DynOptions value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtBeginningWith_ = useDynAtBeginningWith []

useDynAtEnd_
  :: forall value
   . Event value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtEnd_ = useDynAtEnd []

useDynAtEndWith_
  :: forall value
   . Event value
  -> DynOptions value
  -> Hook
       { value :: value
       , remove :: Effect Unit
       , sendTo :: Int -> Effect Unit
       }
useDynAtEndWith_ = useDynAtEndWith []