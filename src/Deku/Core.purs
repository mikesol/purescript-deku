module Deku.Core
  ( module Bolson.Core
  , DOMInterpret(..)
  , MakeRoot
  , MakeElement
  , MakeText
  , MakePursx
  , GiveNewParent
  , DisconnectElement
  , DeleteFromCache
  , SendToTop
  , SetProp
  , SetCb
  , SetText
  , Nut
  , bus
  , bussed
  , vbussed
  , remove
  , sendToTop
  , insert
  , Domable
  , Node(..)
  ) where

import Prelude

import Bolson.Always (AlwaysEffect, halways)
import Bolson.Core (Scope, fixed, dyn, envy)
import Bolson.Core as Bolson
import Control.Monad.ST.Class (class MonadST)
import Data.Maybe (Maybe)
import Data.Monoid.Always (class Always, always)
import Data.Monoid.Endo (Endo)
import Data.Newtype (class Newtype)
import Data.Profunctor (lcmap)
import Deku.Attribute (Cb)
import Effect (Effect)
import FRP.Event (AnEvent)
import FRP.Event as FRP.Event
import FRP.Event.VBus (class VBus, V, vbus)
import Foreign.Object (Object)
import Heterogeneous.Mapping (class MapRecordWithIndex, ConstMapping)
import Prim.RowList (class RowToList)
import Type.Proxy (Proxy)
import Web.DOM as Web.DOM

type Nut =
  forall s m lock payload
   . MonadST s m
  => Always (m Unit) (Effect Unit)
  => Always (Endo Function (Effect (Effect Unit))) (Endo Function (m (m Unit)))
  => Always (Endo Function (Effect Unit)) (Endo Function (m Unit))
  => Always (m (m Unit)) (Effect (Effect Unit))
  => Domable m lock payload

bus
  :: forall a b s m
   . MonadST s m
  => Always (m Unit) (Effect Unit)
  => ((a -> Effect Unit) -> AnEvent m a -> b)
  -> AnEvent m b
bus f = FRP.Event.bus (lcmap (map (always :: m Unit -> Effect Unit)) f)

bussed
  :: forall s m lock logic obj a
   . MonadST s m
  => Always (m Unit) (Effect Unit)
  => ((a -> Effect Unit) -> AnEvent m a -> Bolson.Entity logic obj m lock)
  -> Bolson.Entity logic obj m lock
bussed f = Bolson.EventfulElement' (Bolson.EventfulElement (bus f))

vbussed
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
  -> ({ | pusho } -> { | event } -> Bolson.Entity logic obj m lock)
  -> Bolson.Entity logic obj m lock
vbussed px f = Bolson.EventfulElement'
  (Bolson.EventfulElement (vbus px (lcmap halways f)))

newtype Node m (lock :: Type) payload = Node
  (Bolson.PSR m -> DOMInterpret m payload -> AnEvent m payload)

type Domable m lock payload = Bolson.Entity Unit (Node m lock payload) m lock

insert
  :: forall logic obj m lock
   . Bolson.Entity logic obj m lock
  -> Bolson.Child logic obj m lock
insert = Bolson.Insert

remove :: forall logic obj m lock. Bolson.Child logic obj m lock
remove = Bolson.Remove

sendToTop :: forall obj m lock. Bolson.Child Unit obj m lock
sendToTop = Bolson.Logic unit

type MakeElement =
  { id :: String
  , scope :: Scope
  , parent :: Maybe String
  , tag :: String
  }

type GiveNewParent =
  { id :: String
  , parent :: String
  , scope :: Scope
  }

type DisconnectElement =
  { id :: String
  , parent :: String
  , scope :: Scope
  , scopeEq :: Scope -> Scope -> Boolean
  }

type MakeText =
  { id :: String
  , scope :: Scope
  , parent :: Maybe String
  }

type DeleteFromCache = { id :: String }
type MakeRoot = { id :: String, root :: Web.DOM.Element }
type SetText = { id :: String, text :: String }
type SetProp =
  { id :: String
  , key :: String
  , value :: String
  }

type SetCb =
  { id :: String
  , key :: String
  , value :: Cb
  }

type MakePursx =
  { id :: String
  , parent :: Maybe String
  , html :: String
  , scope :: Scope
  , pxScope :: String
  , verb :: String
  , cache :: Object Boolean
  }

type SendToTop =
  { id :: String
  }

derive instance Newtype (DOMInterpret m payload) _

newtype DOMInterpret m payload = DOMInterpret
  { ids :: m String
  , makeRoot :: MakeRoot -> payload
  , makeElement :: MakeElement -> payload
  , makeText :: MakeText -> payload
  , makePursx :: MakePursx -> payload
  , giveNewParent :: GiveNewParent -> payload
  , disconnectElement :: DisconnectElement -> payload
  , deleteFromCache :: DeleteFromCache -> payload
  , sendToTop :: SendToTop -> payload
  , setProp :: SetProp -> payload
  , setCb :: SetCb -> payload
  , setText :: SetText -> payload
  }