module Deku.DOM.Elt.Rp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Rp_

rp
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Rp_)
  -> seed
  -> Element lock payload
rp attributes seed = elementify "rp" attributes (plant seed)

rp_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
rp_ = rp empty

