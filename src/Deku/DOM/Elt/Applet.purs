module Deku.DOM.Elt.Applet where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Applet_

applet
  :: Event (Attribute Applet_)
  -> Array Domable
  -> Domable
applet = DC.elementify2 "applet"

applet_
  :: Array Domable
  -> Domable
applet_ = applet empty

applet__
  :: String
  -> Domable
applet__ t = applet_ [ DC.text_ t ]
