module Deku.DOM.Elt.Hr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Hr_

hr
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Hr_)
  -> seed
  -> Element lock payload
hr attributes seed = elementify "hr" attributes (plant seed)

hr_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
hr_ = hr empty

