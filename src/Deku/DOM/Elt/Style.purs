module Deku.DOM.Elt.Style where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Style_

style
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Style_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
style attributes kids = Element' (elementify "style" attributes (fixed kids))

style_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
style_ = style empty

