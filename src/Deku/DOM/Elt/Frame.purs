module Deku.DOM.Elt.Frame where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

frame
  :: Array (Attribute Tags.Frame_)
  -> Array Nut
  -> Nut
frame = DC.elementify3 "frame"

frame_
  :: Array Nut
  -> Nut
frame_ = frame empty

frame__
  :: String
  -> Nut
frame__ t = frame_ [ DC.text_ t ]
