module Deku.DOM.Elt.Xdata where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Xdata_

xdata
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Xdata_)
  -> seed
  -> Element lock payload
xdata attributes seed = elementify "data" attributes (plant seed)

xdata_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
xdata_ = xdata empty

