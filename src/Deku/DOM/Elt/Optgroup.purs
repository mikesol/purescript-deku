module Deku.DOM.Elt.Optgroup where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Optgroup_

optgroup
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Optgroup_)
  -> seed
  -> Element lock payload
optgroup attributes seed = elementify "optgroup" attributes (plant seed)

optgroup_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
optgroup_ = optgroup empty

