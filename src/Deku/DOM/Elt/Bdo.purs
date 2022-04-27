module Deku.DOM.Elt.Bdo where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, class Plant, plant)
import Deku.Core (Child, Element, Domable)
import FRP.Event (Event)

data Bdo_

bdo
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => Event (Attribute Bdo_)
  -> seed
  -> Element lock payload
bdo attributes seed = elementify "bdo" attributes (plant seed)

bdo_
  :: forall seed lock payload
   . Plant seed (Domable lock payload)
  => seed
  -> Element lock payload
bdo_ = bdo empty

