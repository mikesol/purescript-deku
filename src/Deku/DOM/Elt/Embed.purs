module Deku.DOM.Elt.Embed where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Embed_

embed
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Embed_)
  -> seed
  -> Element lock payload
embed attributes seed = elementify "embed" attributes (plant seed)

embed_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
embed_ = embed empty

