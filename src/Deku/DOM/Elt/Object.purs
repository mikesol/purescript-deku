module Deku.DOM.Elt.Object where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Object_

object
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Object_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
object attributes kids = Element' (elementify "object" attributes (fixed kids))

object_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
object_ = object empty

