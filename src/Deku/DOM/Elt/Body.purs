module Deku.DOM.Elt.Body where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Body_

body
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Body_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
body attributes kids = Element' (elementify "body" attributes (fixed kids))

body_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
body_ = body empty

