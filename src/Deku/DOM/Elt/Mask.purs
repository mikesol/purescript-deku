module Deku.DOM.Elt.Mask where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Mask_

mask
  :: Array (Poll (Attribute Mask_))
  -> Array Nut
  -> Nut
mask = DC.elementify2 "mask"

mask_
  :: Array Nut
  -> Nut
mask_ = mask empty

mask__
  :: String
  -> Nut
mask__ t = mask_ [ DC.text_ t ]
