module Deku.Core where

import Prelude

import Deku.Attribute (Cb)
import Effect (Effect)
import FRP.Event (Event, bus)
import FRP.Event.VBus (class VBus, V, vbus)
import Foreign.Object (Object)
import Prim.RowList (class RowToList)
import Type.Proxy (Proxy)
import Web.DOM as Web.DOM

data Child lock payload = Insert (Domable lock payload) | SendToTop | Remove

newtype DynamicChildren lock payload = DynamicChildren
  (Event (Event (Child lock payload)))

newtype FixedChildren lock payload = FixedChildren
  (Array (Domable lock payload))

newtype EventfulElement lock payload = EventfulElement
  (Event (Domable lock payload))

type PSR =
  { parent :: String
  , scope :: String
  , raiseId :: String -> Effect Unit
  }

newtype Element (lock :: Type) payload = Element
  (PSR -> DOMInterpret payload -> Event payload)

data Domable lock payload
  = DynamicChildren' (DynamicChildren lock payload)
  | FixedChildren' (FixedChildren lock payload)
  | EventfulElement' (EventfulElement lock payload)
  | Element' (Element lock payload)

fixed
  :: forall lock payload. Array (Domable lock payload) -> Domable lock payload
fixed a = FixedChildren' (FixedChildren a)

dyn
  :: forall lock payload
   . Event (Event (Child lock payload))
  -> Domable lock payload
dyn a = DynamicChildren' (DynamicChildren a)

toDOM
  :: forall lock payload. Event (Domable lock payload) -> Domable lock payload
toDOM a = EventfulElement' (EventfulElement a)

bussed
  :: forall lock payload a
   . ((a -> Effect Unit) -> Event a -> Domable lock payload)
  -> Domable lock payload
bussed f = EventfulElement' (EventfulElement (bus f))

vbussed
  :: forall lock payload rbus bus push event u
   . RowToList bus rbus
  => VBus rbus push event u
  => Proxy (V bus)
  -> ({ | push } -> { | event } -> Domable lock payload)
  -> Domable lock payload
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
type MakeNoop =
  { id :: String
  , scope :: String
  , parent :: String
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
  , dkScope :: String
  , verb :: String
  , cache :: Object Boolean
  }

type SendToTop =
  { id :: String
  }

newtype DOMInterpret payload = DOMInterpret
  { ids :: Effect String
  , makeRoot :: MakeRoot -> payload
  , makeNoop :: MakeNoop -> payload
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