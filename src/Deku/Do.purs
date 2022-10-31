module Deku.Do
  ( bind
  , discard
  , useState'
  , useState
  , useStates'
  , useStates
  , useMemoized
  , useMailboxed
  , useRemoval
  , class InitializeEvents
  , initializeEvents'
  , useDyn
  , useDyn_
  ) where

import Prelude hiding (bind, discard)

import Bolson.Core (Child, envy)
import Control.Alt ((<|>))
import Data.Profunctor (lcmap)
import Data.Symbol (class IsSymbol)
import Data.Tuple (curry)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Core (Domable(..), Node, bus, bussedUncurried, insert, remove, sendToPos, vbussedUncurried)
import Effect (Effect)
import FRP.Event (Event, keepLatest, mailboxed, memoize)
import FRP.Event.VBus (class VBus, V)
import Prim.Row as R
import Prim.RowList (class RowToList, RowList)
import Prim.RowList as RL
import Record as Record
import Safe.Coerce (coerce)
import Type.Proxy (Proxy(..))

bind :: forall a r q. ((a -> r) -> q) -> (a -> r) -> q
bind f a = f a

discard :: forall r q. ((Unit -> r) -> q) -> (Unit -> r) -> q
discard = bind

useState'
  :: forall lock payload a
   . ( ((a -> Effect Unit) /\ Event a)
       -> Domable lock payload
     )
  -> Domable lock payload
useState' = bussedUncurried

useMemoized
  :: forall lock payload a b
   . (Event a -> Event b)
  -> ( ((a -> Effect Unit) /\ Event b)
       -> Domable lock payload
     )
  -> Domable lock payload
useMemoized f0 f1 = bussedUncurried \(a /\ b) -> Domable $ envy
  (coerce (memoize (f0 b) \c -> f1 (a /\ c)))

useState
  :: forall lock payload a
   . a
  -> ( ((a -> Effect Unit) /\ Event a)
       -> Domable lock payload
     )
  -> Domable lock payload
useState a = useMemoized (pure a <|> _)

useStates'
  :: forall lock payload rbus bus push event
   . RowToList bus rbus
  => VBus rbus push event
  => Proxy (V bus)
  -> (({ | push } /\ { | event }) -> Domable lock payload)
  -> Domable lock payload
useStates' = vbussedUncurried

class InitializeEvents :: RowList Type -> Row Type -> Row Type -> Constraint
class InitializeEvents needleRL needle haystack where
  initializeEvents'
    :: Proxy needleRL -> { | needle } -> { | haystack } -> { | haystack }

instance InitializeEvents RL.Nil r1 r2 where
  initializeEvents' _ _ = identity

instance
  ( IsSymbol key
  , R.Cons key value needle' needle
  , R.Cons key (Event value) haystack' haystack
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
  :: forall lock payload rbus bus push event needleRL
       needle
   . RowToList bus rbus
  => RowToList needle needleRL
  => InitializeEvents needleRL needle event
  => VBus rbus push event
  => Proxy (V bus)
  -> { | needle }
  -> (({ | push } /\ { | event }) -> Domable lock payload)
  -> Domable lock payload
useStates v needle = useStates' v <<< lcmap (map (initializeEvents needle))

useMailboxed
  :: forall lock payload a b
   . Ord a
  => ( ( ({ address :: a, payload :: b } -> Effect Unit) /\
           (a -> Event b)
       )
       -> Domable lock payload
     )
  -> Domable lock payload
useMailboxed f = bussedUncurried \(a /\ b) -> Domable $ envy
  (coerce (mailboxed b \c -> f (a /\ c)))

useRemoval
  :: forall a lock payload
   . (Effect Unit /\ (Event (Child Int (Node lock payload) lock)) -> Event a)
  -> Event a
useRemoval f = keepLatest do
  setRemoveMe /\ removeMe <- bus <<< curry
  f (setRemoveMe unit /\ (removeMe $> remove))

useDyn
  :: forall lock payload
   . Int
  -> ( { remove :: Effect Unit, sendTo :: Int -> Effect Unit }
       -> Domable lock payload
     )
  -> Event (Child Int (Node lock payload) lock)
useDyn i f = keepLatest do
  setChildLogic /\ childLogic <- bus <<< curry
  pure
    ( insert i
        ( f
            { remove: setChildLogic remove
            , sendTo: setChildLogic <<< sendToPos
            }
        )
    ) <|> childLogic

useDyn_
  :: forall lock payload
   . ( { remove :: Effect Unit, sendTo :: Int -> Effect Unit }
       -> Domable lock payload
     )
  -> Event (Child Int (Node lock payload) lock)
useDyn_ = useDyn 0