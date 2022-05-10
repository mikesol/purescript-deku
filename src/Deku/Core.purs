module Deku.Core where

import Prelude

import Control.Monad.ST.Class (class MonadST)
import Deku.Attribute (Cb)
import FRP.Event (AnEvent, bus)
import FRP.Event.VBus (class VBus, V, vbus)
import Foreign.Object (Object)
import Prim.RowList (class RowToList)
import Type.Proxy (Proxy)
import Web.DOM as Web.DOM

data Child m lock payload = Insert (Domable m lock payload) | SendToTop | Remove

newtype DynamicChildren m lock payload = DynamicChildren
  (AnEvent m (AnEvent m (Child m lock payload)))

newtype FixedChildren m lock payload = FixedChildren
  (Array (Domable m lock payload))

newtype EventfulElement m lock payload = EventfulElement
  (AnEvent m (Domable m lock payload))

type PSR m =
  { parent :: String
  , scope :: String
  , raiseId :: String -> m Unit
  }

newtype Element m (lock :: Type) payload = Element
  (PSR m -> DOMInterpret m payload -> AnEvent m payload)

data Domable m lock payload
  = DynamicChildren' (DynamicChildren m lock payload)
  | FixedChildren' (FixedChildren m lock payload)
  | EventfulElement' (EventfulElement m lock payload)
  | Element' (Element m lock payload)

fixed
  :: forall m lock payload. Array (Domable m lock payload) -> Domable m lock payload
fixed a = FixedChildren' (FixedChildren a)

dyn
  :: forall m lock payload
   . AnEvent m (AnEvent m (Child m lock payload))
  -> Domable m lock payload
dyn a = DynamicChildren' (DynamicChildren a)

toDOM
  :: forall m lock payload. AnEvent m (Domable m lock payload) -> Domable m lock payload
toDOM a = EventfulElement' (EventfulElement a)

bussed
  :: forall s m lock payload a
   . MonadST s m
  => ((a -> m Unit) -> AnEvent m a -> Domable m lock payload)
  -> Domable m lock payload
bussed f = EventfulElement' (EventfulElement (bus f))

vbussed
  :: forall s m lock payload rbus bus push event u
   . RowToList bus rbus
  => MonadST s m
  => VBus rbus push event u
  => Proxy (V bus)
  -> ({ | push } -> { | event } -> Domable m lock payload)
  -> Domable m lock payload
vbussed px f = EventfulElement' (EventfulElement (vbus px f))

type MakeElement =
  { id :: String
  , scope :: String
  , parent :: String
  , tag :: String
  }
type GiveNewParent =
  { id :: String
  , parent :: String
  , scope :: String
  }
type DisconnectElement =
  { id :: String
  , parent :: String
  , scope :: String
  }
type MakeText =
  { id :: String
  , scope :: String
  , parent :: String
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
  , parent :: String
  , html :: String
  , scope :: String
  , pxScope :: String
  , verb :: String
  , cache :: Object Boolean
  }

type SendToTop =
  { id :: String
  }

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