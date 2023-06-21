module Deku.DOM.Elt.Applet where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

applet
  :: Array (Event (Attribute Tags.Applet_))
  -> Array Nut
  -> Nut
applet = DC.elementify3 "applet"

applet_
  :: Array Nut
  -> Nut
applet_ = applet empty

applet__
  :: String
  -> Nut
applet__ t = applet_ [ DC.text_ t ]
