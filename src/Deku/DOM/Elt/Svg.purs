module Deku.DOM.Elt.Svg where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Svg_

svg
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Svg_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
svg attributes kids = Element' (elementify "svg" attributes (fixed kids))

svg_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
svg_ = svg empty

