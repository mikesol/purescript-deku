module Deku.DOM.Elt.Frame where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Frame_

frame
  :: Array (Poll (Attribute Frame_))
  -> Array Nut
  -> Nut
frame = DC.elementify2 "frame"

frame_
  :: Array Nut
  -> Nut
frame_ = frame empty

frame__
  :: String
  -> Nut
frame__ t = frame_ [ DC.text_ t ]
