module Deku.DOM.Elt.Applet where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Applet_

applet
  :: forall s m lock payload
   . Korok s m
  => AnEvent m (Attribute Applet_)
  -> Array (Domable m lock payload)
  -> Domable m lock payload
applet attributes kids = Element' (elementify "applet" attributes (fixed kids))

applet_
  :: forall s m lock payload
   . Korok s m
  => Array (Domable m lock payload)
  -> Domable m lock payload
applet_ = applet empty

