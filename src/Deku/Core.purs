module Deku.Core where

import Prelude

import Data.Either (Either)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable)
import Deku.Attribute (AttributeValue)
import Effect (Effect)
import FRP.Behavior (Behavior)
import FRP.Event (Event)
import Foreign.Object (Object)
import Web.DOM as Web.DOM

type Element' dom engine = Event (dom -> engine)
type Element_ dom engine =
  String -> DOMInterpret dom engine -> Event (dom -> engine)

type Element =
  forall dom engine. String -> DOMInterpret dom engine -> Event (dom -> engine)

type Subgraph_ index env push dom engine =
  -- the index we're creating at
  index
  -- the pusher for the subgraph
  -> (push -> Effect Unit)
  -- an event the subgraph can bind to
  -> Event (Either env push)
  -- the subgraph
  -> Element_ dom engine

type Subgraph index env push =
  -- the index we're creating at
  index
  -- the pusher for the subgraph
  -> (push -> Effect Unit)
  -- an event the subgraph can bind to
  -> Event (Either env push)
  -- the subgraph
  -> Element

type Ie index env =
  { pos :: Int
  , index :: index
  , env :: Maybe env
  }

type Pie push index env =
  { pos :: Int, index :: index, env :: Nullable (Either env push) }

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
type MakeSubgraph index env push dom engine =
  { id :: String
  , parent :: String
  , scenes :: Subgraph_ index env push dom engine
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
type InsertOrUpdateSubgraph index env =
  { id :: String
  , index :: index
  , env :: env
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

newtype DOMInterpret dom engine = DOMInterpret
  { ids :: Behavior String
  , makeRoot :: MakeRoot -> dom -> engine
  , makeElement :: MakeElement -> dom -> engine
  , makeText :: MakeText -> dom -> engine
  , makePursx :: MakePursx -> dom -> engine
  , makePortal :: MakePortal -> dom -> engine
  , makeGateway :: MakeGateway -> dom -> engine
  , setPortal :: SetPortal -> dom -> engine
  , makeSubgraph ::
      forall index env push
       . MakeSubgraph index env push dom engine
      -> dom
      -> engine
  , setAttribute :: SetAttribute -> dom -> engine
  , sendSubgraphToTop ::
      forall index
       . SendSubgraphToTop index
      -> dom
      -> engine
  , removeSubgraph ::
      forall index
       . RemoveSubgraph index
      -> dom
      -> engine
  , insertOrUpdateSubgraph ::
      forall index env
       . InsertOrUpdateSubgraph index env
      -> dom
      -> engine
  , setText :: SetText -> dom -> engine
  }