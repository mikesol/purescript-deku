module Deku.DOM.Elt.Svg where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Svg_

svg
  :: forall lock payload
   . AnEvent M (Attribute Svg_)
  -> Array (Domable lock payload)
  -> Domable lock payload
svg attributes kids = Element' (elementify "svg" attributes (fixed kids))

svg_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
svg_ = svg empty

