module Deku.DOM.Elt.View where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data View_

view
  :: Event (Attribute View_)
  -> Array Domable
  -> Domable
view = DC.elementify2 "view"

view_
  :: Array Domable
  -> Domable
view_ = view empty

view__
  :: String
  -> Domable
view__ t = view_ [ DC.text_ t ]
