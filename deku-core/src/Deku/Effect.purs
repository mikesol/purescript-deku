-- | Deku.Effect strives to have parity with the hooks API.
-- | The difference is that all of these functions execute at the top level
-- | either in `Effect` or `ST`. That allows you to use the same deku-like
-- | syntax in a `do` as you would in a Deku.do block.
module Deku.Effect
  ( useHot
  , useMailboxed
  , useRant
  , useDeflect
  , useState'
  , useRant'
  , useRefST
  , useRefSTNE
  , useState
  ) where

import Prelude

-- import Bolson.Control (Flatten, behaving, behaving')
-- import Bolson.Control as Bolson
-- import Bolson.Core (Element(..), Entity(..))
import Control.Alt ((<|>))
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal (ST)
import Control.Monad.ST.Internal as STRef
import Data.Newtype (unwrap)
import Data.NonEmpty (NonEmpty(..))
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Core (DOMInterpret(..), DekuExtra, Hook, Node(..), Node', Nut(..), NutF(..))
import Effect (Effect)
import FRP.Event as Event
import FRP.Poll (Poll, sample, stToPoll)
import FRP.Poll as Poll

flattenArgs
  :: forall payload. Flatten Int (DOMInterpret payload) Node DekuExtra payload
flattenArgs =
  { doLogic: \pos (DOMInterpret { sendToPos }) id -> sendToPos { id, pos }
  , ids: unwrap >>> _.ids
  , deferPayload: \(DOMInterpret { deferPayload }) -> deferPayload
  , forcePayload: \(DOMInterpret { forcePayload }) -> forcePayload
  , disconnectElement:
      \(DOMInterpret { disconnectElement }) { id, scope, parent } ->
        disconnectElement { id, scope, parent, scopeEq: eq }
  , toElt: \(Node e) -> e
  }

__internalDekuFlatten
  :: forall payload
   . NutF payload
  -> Node' payload
__internalDekuFlatten (NutF c) a b = Bolson.flatten flattenArgs c a b

-- | A state hook. See [`useState`](https://purescript-deku.netlify.app/core-concepts/state#the-state-hook) in the Deku guide for example usage.
useState'
  :: forall a
   . ST Global ((a -> Effect Unit) /\ Poll a)
useState' = do
  { poll, push } <- Poll.create
  pure (push /\ poll)

useState
  :: forall a
   . a
  -> ST Global ((a -> Effect Unit) /\ Poll a)
useState a = do
  push /\ event <- useState'
  pure (push /\ (pure a <|> event))

useHot
  :: forall a
   . a
  -> ST Global (ST Global Unit /\ (a -> Effect Unit) /\ Poll a)
useHot a = do
  push /\ poll <- useState'
  u /\ r <- useRefST a poll
  pure (u /\ push /\ (stToPoll r <|> poll))

useRant :: forall a. Poll a -> ST Global (ST Global Unit /\ Poll a)
useRant e = do
  { poll, unsubscribe } <- Poll.rant e
  pure (unsubscribe /\ poll)

useDeflect :: forall a. Poll a -> Hook (Poll a)
useDeflect e f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = behaving' \_ ee _ subscribe -> do
    -- todo: should we incorporate the unsub?
    p <- Poll.deflect e
    -- we `once e` in case it has an initial value
    let Nut nf = f p
    subscribe (sample (__internalDekuFlatten nf i di) ee) identity

-- | A hook to work with memoized values that lack an initial value. See [`useRant'`](https://purescript-deku.netlify.app/core-concepts/more-hooks#memoizing-without-an-initial-event) in the Deku guid for example usage.

useRant'
  :: forall t a
   . (Poll t -> Poll a)
  -> ST Global (ST Global Unit /\ (t -> Effect Unit) /\ (Poll a))
useRant' f0 = do
  push /\ e <- useState'
  u /\ m <- useRant (f0 e)
  pure (u /\ push /\ m)

useRefSTNE
  :: forall a
   . NonEmpty Poll a
  -> ST Global (ST Global Unit /\  ST Global a)
useRefSTNE (NonEmpty x y) = useRefST x y

-- | A hook that takes an initial value and an event and produces
-- | a reference to the value that can be used in listeners. While the value
-- | itself is mutable, it cannot be changed by the consumer of the ref.
useRefST
  :: forall a
   . a
  -> Poll a
  -> ST Global (ST Global Unit /\  ST Global a)
useRefST a e = do
  r <- STRef.new a
  ep <- Event.createPure
  u <- Event.subscribe (sample e ep.event) \aa -> liftST $ void $ STRef.write aa r
  ep.push identity
  pure (u /\ STRef.read r)

-- | A hook that provides an event creator instead of events. Event creators turn into events when
-- | given an address, at which point they listen for a payload. This is useful when listening to
-- | large domains like updates of single items over large lists. It runs in _O(log n)_ time.
-- | For example usage, see [`useMailboxed`](https://purescript-deku.netlify.app/core-concepts/more-hooks#use-mailboxed) in the Deku guide.
useMailboxed
  :: forall a b
   . Ord a
  => Hook (({ address :: a, payload :: b } -> Effect Unit) /\ (a -> Poll b))
useMailboxed f = Nut go'
  where
  go' :: forall payload. NutF payload
  go' = NutF (Element' (Node (Element go)))

  go
    :: forall payload
     . Node' payload
  go i di = behaving \e _ subscribe -> do
    { poll, push } <- Poll.mailbox
    let Nut nf = f (push /\ poll)
    subscribe (sample (__internalDekuFlatten nf i di) e)
