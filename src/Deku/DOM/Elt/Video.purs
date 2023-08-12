module Deku.DOM.Elt.Video where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Video_

video
  :: Array (Event (Attribute Video_))
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
