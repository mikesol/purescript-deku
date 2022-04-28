module Deku.DOM.Elt.Param where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Param_

param
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Param_)
  -> seed
  -> Element lock payload
param attributes seed = elementify "param" attributes (plant seed)

param_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
param_ = param empty

