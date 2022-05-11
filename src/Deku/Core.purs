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
  , remove
  , sendToTop
  , insert
  , Domable
  , Node(..)
  ) where

import Prelude

import Bolson.Core (Scope, vbussed, fixed, dyn, envy, bussed)
import Bolson.Core as Bolson
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)
import Deku.Attribute (Cb)
import FRP.Event (AnEvent)
import Foreign.Object (Object)
import Web.DOM as Web.DOM

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