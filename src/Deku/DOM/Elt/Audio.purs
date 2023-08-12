module Deku.DOM.Elt.Audio where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Audio_

audio
  :: Array (Event (Attribute Audio_))
  -> Array Nut
  -> Nut
audio = DC.elementify2 "audio"

audio_
  :: Array Nut
  -> Nut
audio_ = audio empty

audio__
  :: String
  -> Nut
audio__ t = audio_ [ DC.text_ t ]
