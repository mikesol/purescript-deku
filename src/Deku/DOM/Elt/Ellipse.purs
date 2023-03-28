module Deku.DOM.Elt.Ellipse where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Ellipse_

ellipse
  :: Event (Attribute Ellipse_)
  -> Array Domable
  -> Domable
ellipse = DC.elementify2 "ellipse"

ellipse_
  :: Array Domable
  -> Domable
ellipse_ = ellipse empty

ellipse__
  :: String
  -> Domable
ellipse__ t = ellipse_ [ DC.text_ t ]
