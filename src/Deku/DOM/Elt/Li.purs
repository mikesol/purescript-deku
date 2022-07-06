module Deku.DOM.Elt.Li where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Li_

li
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Li_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
li attributes kids = Element' (elementify "li" attributes (fixed kids))

li_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
li_ = li empty

