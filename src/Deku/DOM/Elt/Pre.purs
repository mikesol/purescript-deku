module Deku.DOM.Elt.Pre where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Pre_

pre
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Pre_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
pre attributes kids = Element' (elementify "pre" attributes (fixed kids))

pre_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
pre_ = pre empty

