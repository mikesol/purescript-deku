module Deku.Interpret
  ( FFIDOMSnapshot
  , effectfulDOMInterpret
  , makeFFIDOMSnapshot
  , renderDOM
  ) where

import Prelude

import Control.Alt ((<|>))
import Data.Either (Either(..))
import Data.Exists (runExists)
import Deku.Core (Element(..), SubgraphF(..))
import Deku.Core as Core
import Effect (Effect)
import Effect.Random as R
import FRP.Behavior (behavior)
import FRP.Event (create, makeEvent, subscribe)
import FRP.Event.Phantom (PhantomEvent, Proof0, toEvent, unsafePhantom)
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
  :: forall index env proof
   . String
  -> String
  -> ( index
       -> Effect
            { actualized ::
                PhantomEvent proof (FFIDOMSnapshot -> Effect Unit)
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

effectfulDOMInterpret :: Core.DOMInterpret PhantomEvent Proof0 (FFIDOMSnapshot -> Effect Unit)
effectfulDOMInterpret = Core.DOMInterpret
  { ids: map show $ behavior \f -> unsafePhantom $ makeEvent \k -> do
      r <- R.random
      subscribe (toEvent f) \x -> k (x r)
  , makeElement: makeElement
  , makeRoot: makeRoot_
  , makeText: makeText_
  , makePursx: makePursx_
  , makePortal: makePortal_
  , makeGateway: makeGateway_
  , setPortal: setPortal_
  , makeSubgraph: \{ id, parent, scenes } dom ->
      flip (makeSubgraph id parent) dom \index -> runExists
        ( \(SubgraphF si) -> do
            evtL <- create
            evtR <- create
            let event = map Left evtL.event <|> map Right evtR.event
            let
              actualized =
                let
                  Element elt = si evtR.push (unsafePhantom event)
                in
                  elt parent effectfulDOMInterpret
            pure { actualized, pusher: evtL.push }
        )
        (scenes index)
  , setAttribute: setAttribute_
  , setText: setText_
  , sendSubgraphToTop: sendSubgraphToTop_
  , insertOrUpdateSubgraph: insertOrUpdateSubgraph
  , removeSubgraph: removeSubgraph
  }
