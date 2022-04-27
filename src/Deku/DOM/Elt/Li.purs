module Deku.DOM.Elt.Li where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Li_

li
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Li_)
  -> seed
  -> Element lock payload
li attributes seed = elementify "li" attributes (plant seed)

li_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
li_ = li empty

