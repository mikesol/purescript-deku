module Deku.Interpret
  ( FFIDOMSnapshot
  , effectfulDOMInterpret
  , makeFFIDOMSnapshot
  , renderDOM
  ) where

import Prelude

import Control.Alt ((<|>))
import Data.Either (Either(..))
import Deku.Core as Core
import Deku.Rando (random)
import Effect (Effect)
import FRP.Event (create)
import Foreign.Object (Object)

-- foreign
data FFIDOMSnapshot

foreign import makeFFIDOMSnapshot :: Effect FFIDOMSnapshot

foreign import renderDOM :: Array (Effect Unit) -> Effect Unit

foreign import makeElement_
  :: Core.MakeElement
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import makeRoot_
  :: Core.MakeRoot
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import makeText_
  :: Core.MakeText
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import makeSubgraph_
  :: forall index env
   . String
  -> String
  -> ( index
       -> Effect
            { actualized :: Core.Element' FFIDOMSnapshot (Effect Unit)
            , pusher :: env -> Effect Unit
            }
     )
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import setText_
  :: Core.SetText
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import sendSubgraphToTop_
  :: forall index. Core.SendSubgraphToTop index -> FFIDOMSnapshot -> Effect Unit
foreign import setAttribute_
  :: Core.SetAttribute -> FFIDOMSnapshot -> Effect Unit

foreign import insertOrUpdateSubgraph_
  :: forall index env
   . Core.InsertOrUpdateSubgraph index env
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import removeSubgraph_
  :: forall index
   . Core.RemoveSubgraph index
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import makePursx_
  :: { id :: String
     , parent :: String
     , html :: String
     , verb :: String
     , cache :: Object Boolean
     }
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import makePortal_ :: Core.MakePortal -> FFIDOMSnapshot -> Effect Unit
foreign import makeGateway_ :: Core.MakeGateway -> FFIDOMSnapshot -> Effect Unit
foreign import setPortal_ :: Core.SetPortal -> FFIDOMSnapshot -> Effect Unit

effectfulDOMInterpret :: Core.DOMInterpret FFIDOMSnapshot (Effect Unit)
effectfulDOMInterpret = Core.DOMInterpret
  { ids: map show random
  , makeElement: makeElement_
  , makeRoot: makeRoot_
  , makeText: makeText_
  , makePursx: makePursx_
  , makePortal: makePortal_
  , makeGateway: makeGateway_
  , setPortal: setPortal_
  , makeSubgraph: \{ id, parent, scenes } dom ->
      flip (makeSubgraph_ id parent) dom \index ->
        do
          evtL <- create
          evtR <- create
          let event = map Left evtL.event <|> map Right evtR.event
          let
            actualized = scenes
              index
              evtR.push
              event
              parent
              effectfulDOMInterpret
          pure { actualized, pusher: evtL.push }
  , setAttribute: setAttribute_
  , setText: setText_
  , sendSubgraphToTop: sendSubgraphToTop_
  , insertOrUpdateSubgraph: \{ id, index, env, pos } -> insertOrUpdateSubgraph_
      { id, index, env: Left env, pos }
  , removeSubgraph: removeSubgraph_
  }
