module Deku.DOM.Elt.Tfoot where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Tfoot_

tfoot
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Tfoot_)
  -> seed
  -> Element lock payload
tfoot attributes seed = elementify "tfoot" attributes (plant seed)

tfoot_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
tfoot_ = tfoot empty

