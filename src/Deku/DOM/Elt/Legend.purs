module Deku.DOM.Elt.Legend where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Legend_

legend
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Legend_)
  -> seed
  -> Element lock payload
legend attributes seed = elementify "legend" attributes (plant seed)

legend_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
legend_ = legend empty

