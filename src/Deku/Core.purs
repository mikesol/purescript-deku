module Deku.Core where

import Prelude

import Data.Maybe (Maybe)
import Deku.Attribute (AttributeValue)
import Effect (Effect)
import FRP.Behavior (Behavior)
import FRP.Event (Event)
import Foreign.Object (Object)
import Web.DOM as Web.DOM

data StreamingElt lock payload = Elt (Element lock payload) | SendToTop | Remove

newtype Element (lock :: Type) payload = Element
  ( { parent :: String
    , scope :: String
    , predecessor :: Maybe String
    , raiseId :: String -> Effect Unit
    }
    -> DOMInterpret payload
    -> Event payload
  )

type MakeElement =
  { id :: String
  , scope :: String
  , parent :: String
  , tag :: String
  }
type GiveNewParent =
  { id :: String
  , parent :: String
  }
type MakeNoop =
  { id :: String
  , scope :: String
  , parent :: String
  }
type DisconnectElement =
  { id :: String
  , parent :: String
  }
type MakeText =
  { id :: String
  , scope :: String
  , parent :: String
  }
type MakeRoot = { id :: String, root :: Web.DOM.Element }
type SetText = { id :: String, text :: String }
type SetAttribute =
  { id :: String
  , key :: String
  , value :: AttributeValue
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
  { ids :: Behavior String
  , makeRoot :: MakeRoot -> payload
  , makeNoop :: MakeNoop -> payload
  , makeElement :: MakeElement -> payload
  , makeText :: MakeText -> payload
  , makePursx :: MakePursx -> payload
  , giveNewParent :: GiveNewParent -> payload
  , disconnectElement :: DisconnectElement -> payload
  , sendToTop :: SendToTop -> payload
  , setAttribute :: SetAttribute -> payload
  , setText :: SetText -> payload
  }