module Deku.DOM.Elt.Meter where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), FixedChildren(..))
import FRP.Event (Event)

data Meter_

meter
  :: forall lock payload
   . Event (Attribute Meter_)
  -> Array (Domable lock payload)
  -> Domable lock payload
meter attributes kids = Element' (elementify "meter" attributes (FixedChildren' (FixedChildren kids)))

meter_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
meter_ = meter empty

