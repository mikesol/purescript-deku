module Deku.DOM.Elt.Video where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Video_

video
  :: Event (Attribute Video_)
  -> Array Domable
  -> Domable
video = DC.elementify2 "video"

video_
  :: Array Domable
  -> Domable
video_ = video empty

video__
  :: String
  -> Domable
video__ t = video_ [ DC.text_ t ]
