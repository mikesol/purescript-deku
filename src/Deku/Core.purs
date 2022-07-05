module Deku.Core
  ( DOMInterpret(..)
  , MakeRoot
  , MakeElement
  , AttributeParent
  , MakeText
  , MakePursx
  , GiveNewParent
  , DisconnectElement
  , DeleteFromCache
  , SendToPos
  , SetProp
  , SetCb
  , SetText
  , Nut
  , ANut(..)
  , bus
  , bussed
  , vbussed
  , remove
  , sendToTop
  , sendToPos
  , insert
  , class Korok
  , Domable
  , Node(..)
  ) where

import Prelude

import Bolson.Always (AlwaysEffect, halways)
import Bolson.Core (Scope)
import Bolson.Core as Bolson
import Control.Monad.ST (ST)
import Control.Monad.ST.Class (class MonadST)
import Control.Monad.ST.Global (Global)
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
import Type.Proxy (Proxy(..))

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

type Nut =
  forall s m e lock payload
   . Korok s m
  => Domable e m lock payload

newtype ANut = ANut Nut

bus
  :: forall a b s m
   . Korok s m
  => Always (m Unit) (Effect Unit)
  => ((a -> Effect Unit) -> AnEvent m a -> b)
  -> AnEvent m b
bus f = FRP.Event.bus (lcmap (map (always :: m Unit -> Effect Unit)) f)

bussed
  :: forall s m lock logic obj a
   . Korok s m
  => Always (m Unit) (Effect Unit)
  => ((a -> Effect Unit) -> AnEvent m a -> Bolson.Entity logic obj m lock)
  -> Bolson.Entity logic obj m lock
bussed f = Bolson.EventfulElement' (Bolson.EventfulElement (bus f))

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

newtype Node e m (lock :: Type) payload = Node
  ( Bolson.PSR m
    -> DOMInterpret e m payload
    -> AnEvent m payload
  )

type Domable e m lock payload = Bolson.Entity Int (Node e m lock payload) m lock

insert
  :: forall logic obj m lock
   . Bolson.Entity logic obj m lock
  -> Bolson.Child logic obj m lock
insert = Bolson.Insert

remove :: forall logic obj m lock. Bolson.Child logic obj m lock
remove = Bolson.Remove

sendToTop :: forall obj m lock. Bolson.Child Int obj m lock
sendToTop = Bolson.Logic 0

sendToPos :: forall obj m lock. Int -> Bolson.Child Int obj m lock
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

-- This is called _only_ in dynamic circomstances
-- when we want to disconnect one element from another
-- It may _also_ trigger deletion, but that's a separate operation (deleteFromCache)
-- For example, in the case of portals, we can disconnect the element without deleting it.
type DisconnectElement = { id :: String }

type MakeText =
  { id :: String
  , scope :: Scope
  , parent :: Maybe String
  }

-- this is how we say "remove me completely"
-- that means call remove on _and_ delete the element from the cache to free up memory
type DeleteFromCache = { id :: String }
type MakeRoot e = { id :: String, root :: e }
type SetText = { id :: String, text :: String }
type SetProp =
  { id :: String
  , parent :: Maybe String
  , scope :: Scope
  , key :: String
  , value :: String
  }

type SetCb =
  { id :: String
  , parent :: Maybe String
  , scope :: Scope
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

derive instance Newtype (DOMInterpret e m payload) _

newtype DOMInterpret e m payload = DOMInterpret
  { ids :: m String
  , makeRoot :: MakeRoot e -> payload
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
