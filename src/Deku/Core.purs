module Deku.Core
  ( ANut(..)
  , AttributeParent
  , DOMInterpret(..)
  , DeleteFromCache
  , DisconnectElement
  , Domable
  , GiveNewParent
  , M
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
  , class Korok
  , insert
  , module Bolson.Core
  , remove
  , sendToPos
  , sendToTop
  , vbussed
  , vbussedUncurried
  ) where

import Prelude

import Bolson.Always (AlwaysEffect, halways)
import Bolson.Core (Scope, fixed, dyn, envy)
import Bolson.Core as Bolson
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (class MonadST)
import Control.Monad.ST.Global (Global)
import Data.Maybe (Maybe)
import Data.Monoid.Always (class Always)
import Data.Monoid.Endo (Endo)
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
import Heterogeneous.Mapping (class MapRecordWithIndex, ConstMapping)
import Mermaid (Mermaid, runImpure)
import Prim.RowList (class RowToList)
import Type.Proxy (Proxy(..))
import Web.DOM as Web.DOM

class
  ( Always (m Unit) (Effect Unit)
  , Always (m (m Unit)) (Effect (Effect Unit))
  , Always (m Unit) (Effect Unit)
  , Always (Endo Function (Effect (Effect Unit))) (Endo Function (m (m Unit)))
  , Always (Endo Function (Effect Unit)) (Endo Function (m Unit))
  , MonadST s m
  ) <=
  Korok s m
  | m -> s

instance Korok s (ST s)
instance Korok Global Effect

type Nut = forall lock payload. Domable lock payload

newtype ANut = ANut Nut

bus
  :: forall a b
   . ((a -> Effect Unit) -> AnEvent M a -> b)
  -> AnEvent M b
bus f = FRP.Event.bus (lcmap (map runImpure) f)

busUncurried
  :: forall a b
   . (((a -> Effect Unit) /\ AnEvent M a) -> b)
  -> AnEvent M b
busUncurried = curry >>> bus

bussed
  :: forall lock logic obj a
   . ((a -> Effect Unit) -> AnEvent M a -> Bolson.Entity logic obj M lock)
  -> Bolson.Entity logic obj M lock
bussed f = Bolson.EventfulElement' (Bolson.EventfulElement (bus f))

bussedUncurried
  :: forall lock logic obj a
   . (((a -> Effect Unit) /\ AnEvent M a) -> Bolson.Entity logic obj M lock)
  -> Bolson.Entity logic obj M lock
bussedUncurried = curry >>> bussed

vbussed
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
  -> ({ | pusho } -> { | event } -> Bolson.Entity logic obj m lock)
  -> Bolson.Entity logic obj m lock
vbussed px f = Bolson.EventfulElement'
  (Bolson.EventfulElement (vbus px (lcmap (halways (Proxy :: Proxy m)) f)))

vbussedUncurried
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
vbussedUncurried px = curry >>> vbussed px

type M = Mermaid Global

newtype Node :: Type -> Type -> Type
newtype Node lock payload = Node
  ( Bolson.PSR M -> DOMInterpret payload -> AnEvent M payload
  )

type Domable :: Type -> Type -> Type
type Domable lock payload = Bolson.Entity Int (Node lock payload) M lock

insert
  :: forall logic obj lock
   . Bolson.Entity logic obj M lock
  -> Bolson.Child logic obj M lock
insert = Bolson.Insert

remove :: forall logic obj lock. Bolson.Child logic obj M lock
remove = Bolson.Remove

sendToTop :: forall obj lock. Bolson.Child Int obj M lock
sendToTop = Bolson.Logic 0

sendToPos :: forall obj lock. Int -> Bolson.Child Int obj M lock
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
  { ids :: M String
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
