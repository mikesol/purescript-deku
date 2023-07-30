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
  ( useState
  , useRef
  , useMemoized'
  , useMemoized
  , useMailboxed
  , useDyn
  , useDynAtBeginning
  , useDynAtEnd
  ) where

import Prelude

import Bolson.Control (Flatten)
import Bolson.Control as Bolson
import Bolson.Core (Element(..), Entity(..), envy)
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Internal as STRef
import Data.Newtype (unwrap)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Core (Child, DOMInterpret(..), Hook, Node(..), Node', Nut(..), NutF(..), DekuExtra, dyn, insert, remove, sendToPos)
import Deku.Do as Deku
import Effect (Effect)
import FRP.Event (Event, create, mailbox, makeEvent, mapAccum, memoize, merge, subscribe)

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
useState
  :: forall a
   . Hook ((a -> Effect Unit) /\ Event a)
useState f = Nut go'
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

-- | A hook to work with memoized values. See [`useMemoized`](https://purescript-deku.netlify.app/core-concepts/more-hooks#the-case-for-memoization) in the Deku guide for example usage.
useMemoized
  :: forall a
   . Event a
  -> Hook (Event a)
useMemoized e f1 = Nut eeee
  where
  eeee :: forall payload. NutF payload
  eeee = NutF (envy (map (\(NutF x) -> x) eee))

  eee :: forall payload. Event (NutF payload)
  eee = map (\(Nut df) -> df) ee

  ee :: Event Nut
  ee = memoize e f1

-- | A hook to work with memoized values that lack an initial value. See [`useMemoized'`](https://purescript-deku.netlify.app/core-concepts/more-hooks#memoizing-without-an-initial-event) in the Deku guid for example usage.
useMemoized'
  :: forall a b
   . (Event a -> Event b)
  -> Hook ((a -> Effect Unit) /\ Event b)
useMemoized' f0 makeHook = Deku.do
  push /\ e <- useState
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

useDyn
  :: forall value
   . Event (Tuple Int value)
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDyn e f = dyn $ map
  ( \(Tuple pos value) -> Deku.do
      { remove, sendTo } <- useDyn' pos e
      f { remove, sendTo, value }
  )
  e

useDynAtBeginning
  :: forall value
   . Event value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtBeginning e = useDyn ((0 /\ _) <$> e)

useDynAtEnd
  :: forall value
   . Event value
  -> Hook
       { value :: value, remove :: Effect Unit, sendTo :: Int -> Effect Unit }
useDynAtEnd e = useDyn (mapAccum (\a b -> (a + 1) /\ (a /\ b)) 0 e)

useDyn'
  :: forall a
   . Int
  -> Event a
  -> ( { remove :: Effect Unit, sendTo :: Int -> Effect Unit }
       -> Nut
     )
  -> Event Child
useDyn' i driver f = makeEvent \k -> do
  { event, push } <- create
  subscribe
    ( merge
        [ driver $> insert i
            ( f
                { remove: push remove
                , sendTo: push <<< sendToPos
                }
            )
        , event
        ]
    )
    k
