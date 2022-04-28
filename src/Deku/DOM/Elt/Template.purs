module Deku.DOM.Elt.Template where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Template_

template
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Template_)
  -> seed
  -> Element lock payload
template attributes seed = elementify "template" attributes (plant seed)

template_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
template_ = template empty

