module Deku.DOM.Elt.Tbody where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Tbody_

tbody
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Tbody_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
tbody attributes kids = Element' (elementify "tbody" attributes (fixed kids))

tbody_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
tbody_ = tbody empty

