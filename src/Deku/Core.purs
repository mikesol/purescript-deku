module Deku.Core where

import Prelude

import Data.Exists (Exists)
import Deku.Attribute (AttributeValue)
import Effect (Effect)
import FRP.Behavior (ABehavior)
import Foreign.Object (Object)
import Web.DOM as Web.DOM

newtype Element event payload = Element
  (String -> DOMInterpret event payload -> event payload)

newtype SubgraphF event payload push = SubgraphF
  (
    -- the pusher for the subgraph
    (push -> Effect Unit)
    -- an event the subgraph can bind to
    -> event push
    -- the subgraph
    -> Element event payload
  )

type Subgraph index event payload =
  index -> Exists (SubgraphF event payload)

type MakeElement =
  { id :: String
  , tag :: String
  , parent :: String
  }
type MakeText =
  { id :: String
  , parent :: String
  }
type MakeRoot = { id :: String, root :: Web.DOM.Element }
type SetText = { id :: String, text :: String }
type SetAttribute =
  { id :: String
  , key :: String
  , value :: AttributeValue
  }
type MakeSubgraph index event payload =
  { id :: String
  , parent :: String
  , scenes :: Subgraph index event payload
  }
type MakePortal =
  { id :: String
  }
type MakeGateway =
  { id :: String
  , parent :: String
  , portal :: String
  }
type SetPortal =
  { id :: String
  , on :: Boolean
  }
type MakePursx =
  { id :: String
  , parent :: String
  , html :: String
  , verb :: String
  , cache :: Object Boolean
  }
type InsertSubgraph index =
  { id :: String
  , index :: index
  , pos :: Int
  }
type RemoveSubgraph index =
  { id :: String
  , index :: index
  , pos :: Int
  }

type SendSubgraphToTop index =
  { id :: String
  , index :: index
  , pos :: Int
  }

newtype DOMInterpret event payload = DOMInterpret
  { ids :: ABehavior event String
  , makeRoot :: MakeRoot -> payload
  , makeElement :: MakeElement -> payload
  , makeText :: MakeText -> payload
  , makePursx :: MakePursx -> payload
  , makePortal :: MakePortal -> payload
  , makeGateway :: MakeGateway -> payload
  , setPortal :: SetPortal -> payload
  , makeSubgraph ::
      forall index
       . MakeSubgraph index event payload
      -> payload
  , setAttribute :: SetAttribute -> payload
  , sendSubgraphToTop ::
      forall index
       . SendSubgraphToTop index
      -> payload
  , removeSubgraph ::
      forall index
       . RemoveSubgraph index
      -> payload
  , insertSubgraph ::
      forall index
       . InsertSubgraph index
      -> payload
  , setText :: SetText -> payload
  }