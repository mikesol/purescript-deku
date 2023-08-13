module Deku.DOM.Elt.Pre where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Pre_

pre
  :: Array (Poll (Attribute Pre_))
  -> Array Nut
  -> Nut
pre = DC.elementify2 "pre"

pre_
  :: Array Nut
  -> Nut
pre_ = pre empty

pre__
  :: String
  -> Nut
pre__ t = pre_ [ DC.text_ t ]
