module Deku.DOM.Elt.Pre where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Pre_

pre
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Pre_)
  -> seed
  -> Element lock payload
pre attributes seed = elementify "pre" attributes (plant seed)

pre_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
pre_ = pre empty

