module Deku.Core where

import Prelude

import Data.Variant (Variant)
import Deku.Attribute (AttributeValue)
import Effect (Effect)
import FRP.Event (Event)
import Foreign.Object (Object)
import Web.DOM as Web.DOM

data Child lock payload = Insert (Element lock payload) | SendToTop | Remove

newtype DynamicChildren lock payload = DynamicChildren
  (Event (Event (Child lock payload)))

newtype FixedChildren lock payload = FixedChildren
  (Array (Element lock payload))

newtype EventfulElement lock payload = EventfulElement
  (Event (Domable lock payload))

newtype Element (lock :: Type) payload = Element
  ( { parent :: String
    , scope :: String
    , raiseId :: String -> Effect Unit
    }
    -> DOMInterpret payload
    -> Event payload
  )

newtype Domable lock payload = Domable
  ( Variant
      ( dynamicChildren :: DynamicChildren lock payload
      , fixedChildren :: FixedChildren lock payload
      , eventfulElement :: EventfulElement lock payload
      , element :: Element lock payload
      )
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
  , setAttribute :: SetAttribute -> payload
  , setText :: SetText -> payload
  }