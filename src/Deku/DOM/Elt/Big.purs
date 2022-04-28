module Deku.DOM.Elt.Big where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Big_

big
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Big_)
  -> seed
  -> Element lock payload
big attributes seed = elementify "big" attributes (plant seed)

big_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
big_ = big empty

