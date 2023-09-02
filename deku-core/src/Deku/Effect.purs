-- | Deku.Effect strives to have parity with the hooks API.
-- | The difference is that all of these functions execute at the top level
-- | either in `Effect` or `ST`. That allows you to use the same deku-like
-- | syntax in a `do` as you would in a Deku.do block.
module Deku.Effect
  ( useHot
  , useMailboxed
  , useRant
  , useState'
  , useRant'
  , useRefST
  , useState
  ) where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Global (Global)
import Control.Monad.ST.Internal (ST)
import Control.Monad.ST.Internal as STRef
import Data.Tuple.Nested (type (/\), (/\))
import Effect (Effect)
import FRP.Event as Event
import FRP.Poll (Poll, sample, stToPoll)
import FRP.Poll as Poll

-- | A state hook. See [`useState`](https://purescript-deku.netlify.app/core-concepts/state#the-state-hook) in the Deku guide for example usage.
useState'
  :: forall a
   . Effect ((a -> Effect Unit) /\ Poll a)
useState' = do
  { poll, push } <- liftST Poll.create
  pure (push /\ poll)

useState
  :: forall a
   . a
  -> Effect ((a -> Effect Unit) /\ Poll a)
useState a = do
  push /\ event <- useState'
  pure (push /\ (pure a <|> event))

useHot
  :: forall a
   . a
  -> Effect (Effect Unit /\ (a -> Effect Unit) /\ Poll a)
useHot a = do
  push /\ poll <- useState'
  u /\ r <- useRefST a poll
  pure (u /\ push /\ (stToPoll r <|> poll))

useRant :: forall a. Poll a -> Effect (Effect Unit /\ Poll a)
useRant e = do
  { poll, unsubscribe } <- liftST $ Poll.rant e
  pure (liftST unsubscribe /\ poll)

useRant'
  :: forall t a
   . (Poll t -> Poll a)
  -> Effect (Effect Unit /\ (t -> Effect Unit) /\ (Poll a))
useRant' f0 = do
  push /\ e <- useState'
  u /\ m <- useRant (f0 e)
  pure (u /\ push /\ m)

-- | A hook that takes an initial value and an event and produces
-- | a reference to the value that can be used in listeners. While the value
-- | itself is mutable, it cannot be changed by the consumer of the ref.
useRefST
  :: forall a
   . a
  -> Poll a
  -> Effect (Effect Unit /\  ST Global a)
useRefST a e = do
  r <- liftST $ STRef.new a
  ep <- liftST $ Event.create
  u <- Event.subscribe (sample e ep.event) \aa -> liftST $ void $ STRef.write aa r
  ep.push identity
  pure (u /\  STRef.read r)

-- | A hook that provides an event creator instead of events. Event creators turn into events when
-- | given an address, at which point they listen for a payload. This is useful when listening to
-- | large domains like updates of single items over large lists. It runs in _O(log n)_ time.
-- | For example usage, see [`useMailboxed`](https://purescript-deku.netlify.app/core-concepts/more-hooks#use-mailboxed) in the Deku guide.
useMailboxed
  :: forall a b
   . Ord a
  => Effect (({ address :: a, payload :: b } -> Effect Unit) /\ (a -> Poll b))
useMailboxed = do
  { poll, push } <- liftST $ Poll.mailbox
  pure (push /\ poll)
