module Deku.Example.Docs.Types where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (for_)
import Data.Generic.Rep (class Generic)
import Data.Hashable (class Hashable, hash)
import Data.Map (insert, singleton)
import Data.Maybe (Maybe(..))
import Data.Show.Generic (genericShow)
import Data.Tuple.Nested ((/\))
import Deku.Change (ichange_)
import Deku.Control.Functions.Graph as G
import Deku.Control.Functions.Subgraph (freeze, (@!>))
import Deku.Control.Types (Frame0, Scene)
import Deku.Create (icreate)
import Deku.Graph.Attribute (Cb(..))
import Deku.Graph.DOM (AsSubgraph(..), SubgraphSig, subgraph, (:=))
import Deku.Graph.DOM as D
import Deku.Graph.DOM.Shorthand as S
import Deku.Interpret (makeFFIDOMSnapshot)
import Deku.Run (RunDOM, RunEngine, TriggeredScene, defaultOptions, run)
import Deku.Util (detup)
import Effect (Effect)
import FRP.Event (subscribe)
import Web.DOM as WEB.DOM
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)
data Page
  = Intro
  | HelloWorld
  | SimpleComponent
  | Events
  | Effects
  | Control
  | Subgraph
derive instance Eq Page
derive instance Ord Page
derive instance Generic Page _
instance showPage :: Show Page where
  show s = genericShow s

instance Hashable Page where
  hash = show >>> hash