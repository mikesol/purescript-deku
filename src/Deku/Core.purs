module Deku.Core
  ( ANut(..)
  , AttributeParent
  , DOMInterpret(..)
  , DeleteFromCache
  , DisconnectElement
  , Domable
  , GiveNewParent
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
import Control.Monad.ST (ST)
import Control.Monad.ST.Global (Global)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.Profunctor (lcmap)
import Data.Tuple (curry)
import Data.Tuple.Nested (type (/\))
import Deku.Attribute (Cb)
import Effect (Effect)
import FRP.Event (Event)
import FRP.Event as FRP.Event
import FRP.Event.VBus (class VBus, V, vbus)
import Foreign.Object (Object)
import Prim.RowList (class RowToList)
import Type.Proxy (Proxy)
import Web.DOM as Web.DOM

type Nut = forall lock payload. Domable lock payload

newtype ANut = ANut Nut

bus
  :: forall a b
   . ((a -> Effect Unit) -> Event a -> b)
  -> Event b
bus f = FRP.Event.bus f

busUncurried
  :: forall a b
   . (((a -> Effect Unit) /\ Event a) -> b)
  -> Event b
busUncurried = curry >>> bus

bussed
  :: forall lock logic obj a
   . ((a -> Effect Unit) -> Event a -> Bolson.Entity logic obj lock)
  -> Bolson.Entity logic obj lock
bussed f = Bolson.EventfulElement' (Bolson.EventfulElement (bus f))

bussedUncurried
  :: forall lock logic obj a
   . ( ((a -> Effect Unit) /\ Event a)
       -> Bolson.Entity logic obj lock
     )
  -> Bolson.Entity logic obj lock
bussedUncurried = curry >>> bussed

--

vbussed
  :: forall logic obj lock rbus bus push event
   . RowToList bus rbus
  => VBus rbus push event
  => Proxy (V bus)
  -> ({ | push } -> { | event } -> Bolson.Entity logic obj lock)
  -> Bolson.Entity logic obj lock
vbussed px f = Bolson.EventfulElement'
  (Bolson.EventfulElement (vbus px f))

vbussedUncurried
  :: forall logic obj lock rbus bus push event
   . RowToList bus rbus
  => VBus rbus push event
  => Proxy (V bus)
  -> (({ | push } /\ { | event }) -> Bolson.Entity logic obj lock)
  -> Bolson.Entity logic obj lock
vbussedUncurried px = curry >>> vbussed px

newtype Node (lock :: Type) payload = Node
  ( Bolson.PSR(pos :: Maybe Int)
    -> DOMInterpret payload
    -> Event payload
  )

type Domable lock payload = Bolson.Entity Int (Node lock payload)lock

insert
  :: forall logic lock payload
   . Int
  -> Bolson.Entity logic (Node lock payload)lock
  -> Bolson.Child logic (Node lock payload)lock
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
   . Bolson.Entity logic (Node lock payload) lock
  -> Bolson.Child logic (Node lock payload) lock
insert_ = Bolson.Insert

remove :: forall logic obj lock. Bolson.Child logic obj lock
remove = Bolson.Remove

sendToTop :: forall obj lock. Bolson.Child Int obj lock
sendToTop = Bolson.Logic 0

sendToPos :: forall obj lock. Int -> Bolson.Child Int obj lock
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
  { ids :: ST Global String
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
