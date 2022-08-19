module Deku.Core
  ( ANut(..)
  , AttributeParent
  , DOMInterpret(..)
  , DeleteFromCache
  , DisconnectElement
  , Domable
  , GiveNewParent
  , LiftImpure(..)
  , MakeElement
  , MakePursx
  , MakeRoot
  , MakeText
  , Node(..)
  , Nut
  , SendToPos
  , SetCb
  , SetProp
  , SetText
  , bus
  , busUncurried
  , bussed
  , bussedUncurried
  , hlift
  , insert
  , insert_
  , remove
  , sendToPos
  , sendToTop
  , vbussed
  , vbussedUncurried
  ) where

import Prelude

import Bolson.Core (Scope)
import Bolson.Core as Bolson
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.Profunctor (lcmap)
import Data.Tuple (curry)
import Data.Tuple.Nested (type (/\))
import Deku.Attribute (Cb)
import Effect (Effect)
import FRP.Event (AnEvent)
import FRP.Event as FRP.Event
import FRP.Event.VBus (class VBus, V, vbus)
import Foreign.Object (Object)
import Heterogeneous.Mapping (class HMap, class MapRecordWithIndex, class Mapping, ConstMapping, hmap)
import Hyrule.Zora (Zora, runImpure)
import Prim.RowList (class RowToList)
import Type.Proxy (Proxy)
import Web.DOM as Web.DOM

type Nut = forall lock payload. Domable lock payload

newtype ANut = ANut Nut

bus
  :: forall a b
   . ((a -> Effect Unit) -> AnEvent Zora a -> b)
  -> AnEvent Zora b
bus f = FRP.Event.bus (lcmap (map runImpure) f)

busUncurried
  :: forall a b
   . (((a -> Effect Unit) /\ AnEvent Zora a) -> b)
  -> AnEvent Zora b
busUncurried = curry >>> bus

bussed
  :: forall lock logic obj a
   . ((a -> Effect Unit) -> AnEvent Zora a -> Bolson.Entity logic obj Zora lock)
  -> Bolson.Entity logic obj Zora lock
bussed f = Bolson.EventfulElement' (Bolson.EventfulElement (bus f))

bussedUncurried
  :: forall lock logic obj a
   . ( ((a -> Effect Unit) /\ AnEvent Zora a)
       -> Bolson.Entity logic obj Zora lock
     )
  -> Bolson.Entity logic obj Zora lock
bussedUncurried = curry >>> bussed

--

data LiftImpure = LiftImpure

instance Mapping LiftImpure (i -> Zora Unit) (i -> Effect Unit) where
  mapping _ = map runImpure

instance
  ( HMap LiftImpure (Record i) (Record o)
  ) =>
  Mapping LiftImpure (Record i) (Record o) where
  mapping _ = hmap LiftImpure

hlift :: forall i o. HMap LiftImpure i o => i -> o
hlift = hmap LiftImpure

--

vbussed
  :: forall logic obj lock rbus bus pushi pusho pushR event u
   . RowToList bus rbus
  => RowToList pushi pushR
  => MapRecordWithIndex pushR
       (ConstMapping LiftImpure)
       pushi
       pusho
  => VBus rbus pushi event Zora
  => Proxy (V bus)
  -> ({ | pusho } -> { | event } -> Bolson.Entity logic obj Zora lock)
  -> Bolson.Entity logic obj Zora lock
vbussed px f = Bolson.EventfulElement'
  (Bolson.EventfulElement (vbus px (lcmap hlift f)))

vbussedUncurried
  :: forall logic obj lock rbus bus pushi pusho pushR event
   . RowToList bus rbus
  => RowToList pushi pushR
  => MapRecordWithIndex pushR
       (ConstMapping LiftImpure)
       pushi
       pusho
  => VBus rbus pushi event Zora
  => Proxy (V bus)
  -> (({ | pusho } /\ { | event }) -> Bolson.Entity logic obj Zora lock)
  -> Bolson.Entity logic obj Zora lock
vbussedUncurried px = curry >>> vbussed px

newtype Node (lock :: Type) payload = Node
  ( Bolson.PSR Zora (pos :: Maybe Int)
    -> DOMInterpret payload
    -> AnEvent Zora payload
  )

type Domable lock payload = Bolson.Entity Int (Node lock payload) Zora lock

insert
  :: forall logic lock payload
   . Int
  -> Bolson.Entity logic (Node lock payload) Zora lock
  -> Bolson.Child logic (Node lock payload) Zora lock
insert i e = Bolson.Insert (f e)
  where
  f = case _ of
    Bolson.Element' (Node e') -> Bolson.Element'
      (Node (lcmap (_ { pos = Just i }) e'))
    Bolson.EventfulElement' (Bolson.EventfulElement e') ->
      Bolson.EventfulElement' (Bolson.EventfulElement (map f e'))
    _ -> e

insert_
  :: forall logic lock payload
   . Bolson.Entity logic (Node lock payload) Zora lock
  -> Bolson.Child logic (Node lock payload) Zora lock
insert_ = Bolson.Insert

remove :: forall logic obj lock. Bolson.Child logic obj Zora lock
remove = Bolson.Remove

sendToTop :: forall obj lock. Bolson.Child Int obj Zora lock
sendToTop = Bolson.Logic 0

sendToPos :: forall obj lock. Int -> Bolson.Child Int obj Zora lock
sendToPos = Bolson.Logic

type MakeElement =
  { id :: String
  , scope :: Scope
  , parent :: Maybe String
  , tag :: String
  }

type AttributeParent =
  { id :: String
  , parent :: String
  , pos :: Maybe Int
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

type SendToPos =
  { id :: String
  , pos :: Int
  }

derive instance Newtype (DOMInterpret payload) _

newtype DOMInterpret payload = DOMInterpret
  { ids :: Zora String
  , makeRoot :: MakeRoot -> payload
  , makeElement :: MakeElement -> payload
  , attributeParent :: AttributeParent -> payload
  , makeText :: MakeText -> payload
  , makePursx :: MakePursx -> payload
  , giveNewParent :: GiveNewParent -> payload
  , disconnectElement :: DisconnectElement -> payload
  , deleteFromCache :: DeleteFromCache -> payload
  , sendToPos :: SendToPos -> payload
  , setProp :: SetProp -> payload
  , setCb :: SetCb -> payload
  , setText :: SetText -> payload
  }
