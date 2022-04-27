module Deku.DOM.Elt.Tbody where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Tbody_

tbody
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Tbody_)
  -> seed
  -> Element lock payload
tbody attributes seed = elementify "tbody" attributes (plant seed)

tbody_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
tbody_ = tbody empty

