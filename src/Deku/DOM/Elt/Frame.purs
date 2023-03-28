module Deku.DOM.Elt.Frame where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Frame_

frame
  :: Event (Attribute Frame_)
  -> Array Domable
  -> Domable
frame = DC.elementify2 "frame"

frame_
  :: Array Domable
  -> Domable
frame_ = frame empty

frame__
  :: String
  -> Domable
frame__ t = frame_ [ DC.text_ t ]
