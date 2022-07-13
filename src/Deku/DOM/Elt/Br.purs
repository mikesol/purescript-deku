module Deku.DOM.Elt.Br where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Br_

br
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Br_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
br attributes kids = Element' (elementify "br" attributes (fixed kids))

br_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
br_ = br empty

