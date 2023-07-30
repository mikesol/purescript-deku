module Deku.DOM.Elt.Video where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data Video_

video
  :: Array (Attribute Video_)
  -> Array Nut
  -> Nut
video = DC.elementify2 "video"

video_
  :: Array Nut
  -> Nut
video_ = video empty

video__
  :: String
  -> Nut
video__ t = video_ [ DC.text_ t ]
