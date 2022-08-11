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
import Data.Monoid.Always (class Always)
import Data.Profunctor (lcmap)
import Data.Symbol (class IsSymbol)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Core (class Korok, bussedUncurried, vbussedUncurried)
import Effect (Effect)
import FRP.Event (AnEvent, mailboxed, memoize)
import FRP.Event.VBus (class VBus, V)
import Heterogeneous.Mapping (class MapRecordWithIndex, ConstMapping)
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
  :: forall s m lock logic obj a
   . Korok s m
  => Always (m Unit) (Effect Unit)
  => (((a -> Effect Unit) /\ AnEvent m a) -> Bolson.Entity logic obj m lock)
  -> Bolson.Entity logic obj m lock
useState' = bussedUncurried

useMemoized
  :: forall s m lock logic obj a b
   . Korok s m
  => Always (m Unit) (Effect Unit)
  => (AnEvent m a -> AnEvent m b)
  -> (((a -> Effect Unit) /\ AnEvent m b) -> Bolson.Entity logic obj m lock)
  -> Bolson.Entity logic obj m lock
useMemoized f0 f1 = bussedUncurried \(a /\ b) -> envy
  (memoize (f0 b) \c -> f1 (a /\ c))

useState
  :: forall s m lock logic obj a
   . Korok s m
  => Always (m Unit) (Effect Unit)
  => a
  -> (((a -> Effect Unit) /\ AnEvent m a) -> Bolson.Entity logic obj m lock)
  -> Bolson.Entity logic obj m lock
useState a = useState' <<< lcmap (map (pure a <|> _))

useStates'
  :: forall s m logic obj lock rbus bus pushi pusho pushR event u
   . RowToList bus rbus
  => Korok s m
  => RowToList pushi pushR
  => MapRecordWithIndex pushR
       (ConstMapping (AlwaysEffect m))
       pushi
       pusho
  => VBus rbus pushi event u
  => Proxy (V bus)
  -> (({ | pusho } /\ { | event }) -> Bolson.Entity logic obj m lock)
  -> Bolson.Entity logic obj m lock
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
  , R.Cons key (AnEvent m value) haystack' haystack
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
  :: forall s m logic obj lock rbus bus pushi pusho pushR event u needleRL
       needle
   . RowToList bus rbus
  => RowToList needle needleRL
  => InitializeEvents needleRL needle event
  => Korok s m
  => RowToList pushi pushR
  => MapRecordWithIndex pushR
       (ConstMapping (AlwaysEffect m))
       pushi
       pusho
  => VBus rbus pushi event u
  => Proxy (V bus)
  -> { | needle }
  -> (({ | pusho } /\ { | event }) -> Bolson.Entity logic obj m lock)
  -> Bolson.Entity logic obj m lock
useStates v needle = useStates' v <<< lcmap (map (initializeEvents needle))

useMailboxed
  :: forall s m lock logic obj a b
   . Korok s m
  => Ord a
  => Always (m Unit) (Effect Unit)
  => ( (({ address :: a, payload :: b } -> Effect Unit) /\ (a -> AnEvent m b))
       -> Bolson.Entity logic obj m lock
     )
  -> Bolson.Entity logic obj m lock
useMailboxed f = bussedUncurried \(a /\ b) -> envy
  (mailboxed b \c -> f (a /\ c))
