module Deku.DOM.Elt.Base where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Base_

base
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Base_)
  -> seed
  -> Element lock payload
base attributes seed = elementify "base" attributes (plant seed)

base_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
base_ = base empty

