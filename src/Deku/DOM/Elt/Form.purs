module Deku.DOM.Elt.Form where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Form_

form
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Form_)
  -> seed
  -> Element lock payload
form attributes seed = elementify "form" attributes (plant seed)

form_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
form_ = form empty

