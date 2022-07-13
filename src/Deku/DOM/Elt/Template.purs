module Deku.DOM.Elt.Template where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Template_

template
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Template_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
template attributes kids = Element' (elementify "template" attributes (fixed kids))

template_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
template_ = template empty

