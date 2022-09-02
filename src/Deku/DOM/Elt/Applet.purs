module Deku.DOM.Elt.Applet where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (Event)


data Applet_

applet
  :: forall lock payload
   . Event (Attribute Applet_)
  -> Array (Domable lock payload)
  -> Domable lock payload
applet attributes kids = Element' (elementify "applet" attributes (fixed kids))

applet_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
applet_ = applet empty

