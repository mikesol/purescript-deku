module Deku.DOM.Elt.Pre where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Pre_

pre
  :: Event (Attribute Pre_)
  -> Array Domable
  -> Domable
pre = DC.elementify2 "pre"

pre_
  :: Array Domable
  -> Domable
pre_ = pre empty

pre__
  :: String
  -> Domable
pre__ t = pre_ [ DC.text_ t ]
