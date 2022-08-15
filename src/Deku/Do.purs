module Deku.Do
  ( bind
  , discard
  , useState'
  , useState
  , useStates'
  , useStates
  , useMemoized
  , useMailboxed
  , class InitializeEvents
  , initializeEvents'
  ) where

import Prelude hiding (bind, discard)

import Bolson.Always (AlwaysEffect)
import Bolson.Core (envy)
import Bolson.Core as Bolson
import Control.Alt ((<|>))
import Control.Monad.ST.Class (class MonadST)
import Data.Profunctor (lcmap)
import Data.Symbol (class IsSymbol)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Core (bussedUncurried, vbussedUncurried)
import Effect (Effect)
import FRP.Event (AnEvent, mailboxed, memoize)
import FRP.Event.VBus (class VBus, V)
import Heterogeneous.Mapping (class MapRecordWithIndex, ConstMapping)
import Hyrule.Zora (Zora)
import Prim.Row as R
import Prim.RowList (class RowToList, RowList)
import Prim.RowList as RL
import Record as Record
import Type.Proxy (Proxy(..))

bind :: forall a r q. ((a -> r) -> q) -> (a -> r) -> q
bind f a = f a

discard :: forall r q. ((Unit -> r) -> q) -> (Unit -> r) -> q
discard = bind

useState'
  :: forall lock logic obj a
   . (((a -> Effect Unit) /\ AnEvent Zora a) -> Bolson.Entity logic obj Zora lock)
  -> Bolson.Entity logic obj Zora lock
useState' = bussedUncurried

useMemoized
  :: forall lock logic obj a b
   . (AnEvent Zora a -> AnEvent Zora b)
  -> (((a -> Effect Unit) /\ AnEvent Zora b) -> Bolson.Entity logic obj Zora lock)
  -> Bolson.Entity logic obj Zora lock
useMemoized f0 f1 = bussedUncurried \(a /\ b) -> envy
  (memoize (f0 b) \c -> f1 (a /\ c))

useState
  :: forall lock logic obj a
   . a
  -> (((a -> Effect Unit) /\ AnEvent Zora a) -> Bolson.Entity logic obj Zora lock)
  -> Bolson.Entity logic obj Zora lock
useState a = useMemoized (pure a <|> _)

useStates'
  :: forall logic obj lock rbus bus pushi pusho pushR event u
   . RowToList bus rbus
  => RowToList pushi pushR
  => MapRecordWithIndex pushR
       (ConstMapping (AlwaysEffect Zora))
       pushi
       pusho
  => VBus rbus pushi event u
  => Proxy (V bus)
  -> (({ | pusho } /\ { | event }) -> Bolson.Entity logic obj Zora lock)
  -> Bolson.Entity logic obj Zora lock
useStates' = vbussedUncurried

class InitializeEvents :: RowList Type -> Row Type -> Row Type -> Constraint
class InitializeEvents needleRL needle haystack where
  initializeEvents'
    :: Proxy needleRL -> { | needle } -> { | haystack } -> { | haystack }

instance InitializeEvents RL.Nil r1 r2 where
  initializeEvents' _ _ = identity

instance
  ( Applicative m
  , MonadST s m
  , IsSymbol key
  , R.Cons key value needle' needle
  , R.Cons key (AnEvent Zora value) haystack' haystack
  , InitializeEvents rest needle haystack
  ) =>
  InitializeEvents (RL.Cons key value rest) needle haystack where
  initializeEvents' _ needle haystack =
    let
      key = Proxy :: _ key
    in
      initializeEvents' (Proxy :: _ rest) needle
        (Record.modify key (pure (Record.get key needle) <|> _) haystack)

initializeEvents
  :: forall needleRL needle haystack
   . RL.RowToList needle needleRL
  => InitializeEvents needleRL needle haystack
  => { | needle }
  -> { | haystack }
  -> { | haystack }
initializeEvents = initializeEvents' (Proxy :: _ needleRL)

useStates
  :: forall logic obj lock rbus bus pushi pusho pushR event u needleRL
       needle
   . RowToList bus rbus
  => RowToList needle needleRL
  => InitializeEvents needleRL needle event
  => RowToList pushi pushR
  => MapRecordWithIndex pushR
       (ConstMapping (AlwaysEffect Zora))
       pushi
       pusho
  => VBus rbus pushi event u
  => Proxy (V bus)
  -> { | needle }
  -> (({ | pusho } /\ { | event }) -> Bolson.Entity logic obj Zora lock)
  -> Bolson.Entity logic obj Zora lock
useStates v needle = useStates' v <<< lcmap (map (initializeEvents needle))

useMailboxed
  :: forall lock logic obj a b
   . Ord a
  => ( (({ address :: a, payload :: b } -> Effect Unit) /\ (a -> AnEvent Zora b))
       -> Bolson.Entity logic obj Zora lock
     )
  -> Bolson.Entity logic obj Zora lock
useMailboxed f = bussedUncurried \(a /\ b) -> envy
  (mailboxed b \c -> f (a /\ c))
