module Deku.DOM.Elt.Font where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Font_

font
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Font_)
  -> seed
  -> Element lock payload
font attributes seed = elementify "font" attributes (plant seed)

font_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
font_ = font empty

