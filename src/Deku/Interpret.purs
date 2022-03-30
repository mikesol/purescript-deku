module Deku.Interpret
  ( FFIDOMSnapshot
  , effectfulDOMInterpret
  , makeFFIDOMSnapshot
  , renderDOM
  ) where

import Prelude

import Control.Alt ((<|>))
import Data.Either (Either(..))
import Deku.Core (DOMInterpret(..), Element', SendSubgraphToTopInput)
import Deku.Rando (random)
import Deku.Rendered as R
import Effect (Effect)
import FRP.Event (create)

data FFIDOMSnapshot
foreign import makeFFIDOMSnapshot :: Effect FFIDOMSnapshot
foreign import renderDOM :: Array (Effect Unit) -> Effect Unit

foreign import makeElement_
  :: R.MakeElement
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import makeRoot_
  :: R.MakeRoot
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import makeText_
  :: R.MakeText
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import makeSubgraph_
  :: forall index env

  -- me
  . String
  -- parent
  -> String
  -- this is the generic function for how to interpret a scene
  -> ( index
       -> Effect
            { actualized :: Element' FFIDOMSnapshot (Effect Unit)
            , pusher :: env -> Effect Unit
            }
     )
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import setText_
  :: R.SetText
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import sendSubgraphToTop_
  :: forall index. SendSubgraphToTopInput index -> FFIDOMSnapshot -> Effect Unit
foreign import setAttribute_
  :: R.SetAttribute -> FFIDOMSnapshot -> Effect Unit

foreign import insertOrUpdateSubgraph_
  :: forall env push index
   . {id :: String, pos :: Int, index :: index, env ::Either env push }
  -> FFIDOMSnapshot
  -> Effect Unit

foreign import removeSubgraph_
  :: forall index
   . {id :: String, pos :: Int, index :: index }
  -> FFIDOMSnapshot
  -> Effect Unit

effectfulDOMInterpret
  :: DOMInterpret FFIDOMSnapshot (Effect Unit)
effectfulDOMInterpret = DOMInterpret
  { ids: map show random
  , makeElement: makeElement_
  , makeRoot: makeRoot_
  , makeText: makeText_
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
