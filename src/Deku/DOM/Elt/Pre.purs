module Deku.DOM.Elt.Pre where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Pre_

pre
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Pre_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
pre attributes kids = Element' (elementify "pre" attributes (fixed kids))

pre_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
pre_ = pre empty

