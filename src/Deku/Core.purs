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
  , busUncurried
  , bussed
  , bussedUncurried
  , vbussed
  , vbussedUncurried
  , remove
  , sendToTop
  , sendToPos
  , insert
  , insert_
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
import Data.Maybe (Maybe(..))
import Data.Monoid.Always (class Always, always)
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

type Nut =
  forall s m lock payload
   . Korok s m
  => Domable m lock payload

newtype ANut = ANut Nut

bus
  :: forall a b s m
   . Korok s m
  => Always (m Unit) (Effect Unit)
  => ((a -> Effect Unit) -> AnEvent m a -> b)
  -> AnEvent m b
bus f = FRP.Event.bus (lcmap (map (always :: m Unit -> Effect Unit)) f)

busUncurried
  :: forall a b s m
   . Korok s m
  => Always (m Unit) (Effect Unit)
  => (((a -> Effect Unit) /\ AnEvent m a) -> b)
  -> AnEvent m b
busUncurried = curry >>> bus

bussed
  :: forall s m lock logic obj a
   . Korok s m
  => Always (m Unit) (Effect Unit)
  => ((a -> Effect Unit) -> AnEvent m a -> Bolson.Entity logic obj m lock)
  -> Bolson.Entity logic obj m lock
bussed f = Bolson.EventfulElement' (Bolson.EventfulElement (bus f))

bussedUncurried
  :: forall s m lock logic obj a
   . Korok s m
  => Always (m Unit) (Effect Unit)
  => (((a -> Effect Unit) /\ AnEvent m a) -> Bolson.Entity logic obj m lock)
  -> Bolson.Entity logic obj m lock
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

newtype Node m (lock :: Type) payload = Node
  ( Bolson.PSR m (pos :: Maybe Int)
    -> DOMInterpret m payload
    -> AnEvent m payload
  )

type Domable m lock payload = Bolson.Entity Int (Node m lock payload) m lock

insert
  :: forall logic m lock payload
   . Int
  -> Bolson.Entity logic (Node m lock payload) m lock
  -> Bolson.Child logic (Node m lock payload) m lock
insert i e = Bolson.Insert case e of
  Bolson.Element' (Node e') -> Bolson.Element' (Node (lcmap (_ { pos = Just i}) e'))
  _ -> e

insert_
  :: forall logic m lock payload
   . Bolson.Entity logic (Node m lock payload) m lock
  -> Bolson.Child logic (Node m lock payload) m lock
insert_ = Bolson.Insert

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

derive instance Newtype (DOMInterpret m payload) _

newtype DOMInterpret m payload = DOMInterpret
  { ids :: m String
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
