module Deku.Interpret
  ( FFIDOMSnapshot
  , effectfulDOMInterpret
  , makeFFIDOMSnapshot
  , renderDOM
  ) where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Either (Either(..))
import Data.Foldable (foldl)
import Data.Maybe (Maybe(..))
import Data.Monoid.Additive (Additive)
import Data.Newtype (unwrap)
import Data.Nullable (Nullable, null, toNullable)
import Data.Traversable (traverse)
import Data.Tuple (fst, snd)
import Data.Tuple.Nested (type (/\), (/\))
import Data.Typelevel.Undefined (undefined)
import Deku.Core (DOMInterpret(..), Element, Ie, Pie, SubgraphInput, Element')
import Deku.Rando (random)
import Deku.Rendered (Instruction)
import Deku.Rendered as R
import Effect (Effect)
import Effect.Ref (Ref, modify_, new, read)
import Effect.Unsafe (unsafePerformEffect)
import FRP.Behavior (Behavior)
import FRP.Event (Event, create, filterMap, subscribe)
import Unsafe.Coerce (unsafeCoerce)

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
  :: forall index env push scene
   . String
  -- this is the generic function for how to interpret a scene
  -> ( index
       -> (push -> Effect Unit)
       -> Event (Either env push)
       -> Element FFIDOMSnapshot (Effect Unit)
     )
  -> ( Int
       -> index
       -> Effect (Element' FFIDOMSnapshot (Effect Unit))
     )
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import setText_
  :: R.SetText
  -> FFIDOMSnapshot
  -> Effect Unit
foreign import sendSubgraphToTop_ :: R.SendSubgraphToTop -> FFIDOMSnapshot -> Effect Unit
foreign import setAttribute_
  :: R.SetAttribute -> FFIDOMSnapshot -> Effect Unit

foreign import setSubgraph_
  :: forall env push index
   . String
  -> Array (Pie push index env)
  -> FFIDOMSnapshot
  -> Effect Unit

envsToFFI
  :: forall index env push
   . Array (Ie index env)
  -> Array (Pie push index env)
envsToFFI = map go
  where
  go { pos, index, env } = { pos, index, env: toNullable $ map Left env }

effectfulDOMInterpret
  :: DOMInterpret FFIDOMSnapshot (Effect Unit)
effectfulDOMInterpret = DOMInterpret
  { ids: map show random
  , makeElement: makeElement_
  , makeRoot: makeRoot_
  , makeText: makeText_
  , makeSubgraph: \{ id, parent, scenes } dom ->
      {-( index
       -> (push -> Effect Unit)
       -> Event (Either env push)
       -> Element dom engine
     )
  -> ( Int
       -> index
       -> Effect Unit
            --{ push :: Either env push -> Effect Unit
            --, event :: Event (FFIDOMSnapshot -> Effect Unit)
            --, unsubscribe :: Effect Unit
            }
     )-}
      flip (makeSubgraph_ id scenes) dom \pos index ->
        do
          evtL <- create
          evtR <- create
          let event = map Left evtL.event <|> map Right evtR.event
          let actualized = scenes index evtR.push event parent effectfulDOMInterpret
          pure actualized
  , setAttribute: setAttribute_
  , setText: setText_
  , sendSubgraphToTop: sendSubgraphToTop_
  , setSubgraph: \{ id, envs } dom -> setSubgraph_ id
      (envsToFFI envs)
      (dom)
  }
