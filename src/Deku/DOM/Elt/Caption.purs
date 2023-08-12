module Deku.DOM.Elt.Caption where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Caption_

caption
  :: Array (Poll (Attribute Caption_))
  -> Array Nut
  -> Nut
caption = DC.elementify2 "caption"

caption_
  :: Array Nut
  -> Nut
caption_ = caption empty

caption__
  :: String
  -> Nut
caption__ t = caption_ [ DC.text t ]
