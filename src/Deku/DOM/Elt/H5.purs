module Deku.DOM.Elt.H5 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data H5_

h5
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute H5_)
  -> seed
  -> Element lock payload
h5 attributes seed = elementify "h5" attributes (plant seed)

h5_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
h5_ = h5 empty

