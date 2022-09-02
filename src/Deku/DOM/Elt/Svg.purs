module Deku.DOM.Elt.Svg where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Svg_

svg
  :: forall lock payload
   . Event (Attribute Svg_)
  -> Array (Domable lock payload)
  -> Domable lock payload
svg attributes kids = Element' (elementify "svg" attributes (fixed kids))

svg_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
svg_ = svg empty

