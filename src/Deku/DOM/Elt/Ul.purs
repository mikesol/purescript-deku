module Deku.DOM.Elt.Ul where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Ul_

ul
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Ul_)
  -> seed
  -> Element lock payload
ul attributes seed = elementify "ul" attributes (plant seed)

ul_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
ul_ = ul empty

