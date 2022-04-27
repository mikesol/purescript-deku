module Deku.DOM.Elt.Div where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Div_

div
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Div_)
  -> seed
  -> Element lock payload
div attributes seed = elementify "div" attributes (plant seed)

div_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
div_ = div empty

