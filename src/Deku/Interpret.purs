module Deku.Interpret
  ( FFIDOMSnapshot
  , effectfulDOMInterpret
  , makeFFIDOMSnapshot
  , renderDOM
  ) where

import Prelude

import Data.Exists (runExists)
import Deku.Core (Element(..), SubgraphF(..))
import Deku.Core as Core
import Effect (Effect)
import Effect.Random as R
import FRP.Behavior (behavior)
import FRP.Event (Event, makeEvent, subscribe)
import FRP.Event.Memoized as Memoized
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
  :: forall index
   . String
  -> String
  -> ( index
       -> Effect
            { actualized ::
                Event (FFIDOMSnapshot -> Effect Unit)
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

foreign import insertSubgraph
  :: forall index
   . Core.InsertSubgraph index
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
     , scope :: String
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
      flip (makeSubgraph id parent) dom \index -> runExists
        ( \(SubgraphF si) -> do
            evt <- Memoized.create
            let
              actualized =
                let
                  Element elt = si evt.push $ Memoized.toEvent evt.event
                in
                  elt parent effectfulDOMInterpret
            pure { actualized }
        )
        (scenes index)
  , setAttribute: setAttribute_
  , setText: setText_
  , sendSubgraphToTop: sendSubgraphToTop_
  , insertSubgraph: insertSubgraph
  , removeSubgraph: removeSubgraph
  }
