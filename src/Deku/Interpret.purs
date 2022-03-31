module Deku.Interpret
  ( FFIDOMSnapshot
  , effectfulDOMInterpret
  , makeFFIDOMSnapshot
  , renderDOM
  ) where

import Prelude

import Control.Alt ((<|>))
import Data.Either (Either(..))
import Deku.Core (Element(..))
import Deku.Core as Core
import Effect (Effect)
import Effect.Random as R
import FRP.Behavior (behavior)
import FRP.Event (Event, create, makeEvent, subscribe)
import Foreign.Object (Object)

-- foreign
data FFIDOMSnapshot

foreign import makeFFIDOMSnapshot :: Effect FFIDOMSnapshot

foreign import renderDOM :: Array (Effect Unit) -> Effect Unit

foreign import makeElement
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

foreign import makeSubgraph
  :: forall index env
   . String
  -> String
  -> ( index
       -> Effect
            { actualized ::
                Event (FFIDOMSnapshot -> Effect Unit)
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

foreign import insertOrUpdateSubgraph
  :: forall index env
   . Core.InsertOrUpdateSubgraph index env
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import removeSubgraph
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

effectfulDOMInterpret :: Core.DOMInterpret Event (FFIDOMSnapshot -> Effect Unit)
effectfulDOMInterpret = Core.DOMInterpret
  { ids: map show $ behavior \f -> makeEvent \k -> do
      r <- R.random
      subscribe f \x -> k (x r)
  , makeElement: makeElement
  , makeRoot: makeRoot_
  , makeText: makeText_
  , makePursx: makePursx_
  , makePortal: makePortal_
  , makeGateway: makeGateway_
  , setPortal: setPortal_
  , makeSubgraph: \{ id, parent, scenes } dom ->
      flip (makeSubgraph id parent) dom \index ->
        do
          evtL <- create
          evtR <- create
          let event = map Left evtL.event <|> map Right evtR.event
          let
            actualized =
              let
                Element elt = scenes index
                  evtR.push
                  event
              in
                elt parent effectfulDOMInterpret
          pure { actualized, pusher: evtL.push }
  , setAttribute: setAttribute_
  , setText: setText_
  , sendSubgraphToTop: sendSubgraphToTop_
  , insertOrUpdateSubgraph: \{ id, index, env, pos } -> insertOrUpdateSubgraph
      { id, index, env: Left env, pos }
  , removeSubgraph: removeSubgraph
  }
