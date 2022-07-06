module Deku.DOM.Elt.Thead where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Thead_

thead
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Thead_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
thead attributes kids = Element' (elementify "thead" attributes (fixed kids))

thead_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
thead_ = thead empty

