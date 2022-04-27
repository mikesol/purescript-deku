module Deku.DOM.Elt.Dd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Dd_

dd
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Dd_)
  -> seed
  -> Element lock payload
dd attributes seed = elementify "dd" attributes (plant seed)

dd_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
dd_ = dd empty

