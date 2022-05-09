module Deku.DOM.Elt.Map where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Map_

map
  :: forall lock payload
   . Event (Attribute Map_)
  -> Array (Domable lock payload)
  -> Domable lock payload
map attributes kids = Element' (elementify "map" attributes (FixedChildren' (FixedChildren kids)))

map_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
map_ = map empty

