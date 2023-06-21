module Deku.DOM.Elt.Video where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

video
  :: Array (Attribute Tags.Video_)
  -> Array Nut
  -> Nut
video = DC.elementify3 "video"

video_
  :: Array Nut
  -> Nut
video_ = video empty

video__
  :: String
  -> Nut
video__ t = video_ [ DC.text_ t ]
