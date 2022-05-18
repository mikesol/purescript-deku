module Deku.TLDW where

import Prelude

import Bolson.Always (AlwaysEffect, halways)
import Bolson.Core (Entity(..), EventfulElement(..))
import Control.Monad.ST.Class (class MonadST)
import Data.Monoid.Always (class Always, always)
import Data.Profunctor (lcmap)
import Deku.Core (Domable)
import Effect (Effect)
import FRP.Event (AnEvent, bus)
import FRP.Event.VBus (class VBus, V, vbus)
import Heterogeneous.Mapping (class MapRecordWithIndex, ConstMapping)
import Prim.RowList (class RowToList)
import Type.Proxy (Proxy)

type Nut =
  forall s m lock payload
   . MonadST s m
  => Always (m Unit) (Effect Unit)
  => Domable m lock payload

type Nut' m =
  forall s lock payload
   . MonadST s m
  => Always (m Unit) (Effect Unit)
  => Domable m lock payload

abus
  :: forall a b s m
   . MonadST s m
  => Always (m Unit) (Effect Unit)
  => ((a -> Effect Unit) -> AnEvent m a -> b)
  -> AnEvent m b
abus f = bus (lcmap (map (always :: m Unit -> Effect Unit)) f)

abussed
  :: forall s m lock logic obj a
   . MonadST s m
  => Always (m Unit) (Effect Unit)
  => ((a -> Effect Unit) -> AnEvent m a -> Entity logic obj m lock)
  -> Entity logic obj m lock
abussed f = EventfulElement' (EventfulElement (abus f))

avbussed
  :: forall s m logic obj lock rbus bus pushi pusho pushR event u
   . RowToList bus rbus
  => MonadST s m
  => RowToList pushi pushR
  => MapRecordWithIndex pushR
       (ConstMapping AlwaysEffect)
       pushi
       pusho
  => VBus rbus pushi event u
  => Proxy (V bus)
  -> ({ | pusho } -> { | event } -> Entity logic obj m lock)
  -> Entity logic obj m lock
avbussed px f = EventfulElement' (EventfulElement (vbus px (lcmap halways f)))