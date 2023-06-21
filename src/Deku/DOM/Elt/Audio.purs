module Deku.DOM.Elt.Audio where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

audio
  :: Array (Attribute Tags.Audio_)
  -> Array Nut
  -> Nut
audio = DC.elementify3 "audio"

audio_
  :: Array Nut
  -> Nut
audio_ = audio empty

audio__
  :: String
  -> Nut
audio__ t = audio_ [ DC.text_ t ]
