module Deku.DOM.Elt.Applet where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify, fixed)
import Deku.Core (Domable, class Korok)
import Bolson.Core (Entity(..))
import FRP.Event (AnEvent)

data Applet_

applet
  :: forall s m e lock payload
   . Korok s m
  => AnEvent m (Attribute Applet_)
  -> Array (Domable e m lock payload)
  -> Domable e m lock payload
applet attributes kids = Element' (elementify "applet" attributes (fixed kids))

applet_
  :: forall s m e lock payload
   . Korok s m
  => Array (Domable e m lock payload)
  -> Domable e m lock payload
applet_ = applet empty

