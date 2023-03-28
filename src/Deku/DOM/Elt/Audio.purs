module Deku.DOM.Elt.Audio where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Audio_

audio
  :: Event (Attribute Audio_)
  -> Array Domable
  -> Domable
audio = DC.elementify2 "audio"

audio_
  :: Array Domable
  -> Domable
audio_ = audio empty

audio__
  :: String
  -> Domable
audio__ t = audio_ [ DC.text_ t ]
