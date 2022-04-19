module Deku.DOM.Elt.Applet where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Applet_

applet
  :: forall event payload
   . IsEvent event
  => event (Attribute Applet_)
  -> Array (Element event payload)
  -> Element event payload
applet = elementify "applet"

applet_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
applet_ = applet empty
