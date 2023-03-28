module Deku.DOM.Elt.Progress where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Progress_

progress
  :: Event (Attribute Progress_)
  -> Array Domable
  -> Domable
progress = DC.elementify2 "progress"

progress_
  :: Array Domable
  -> Domable
progress_ = progress empty

progress__
  :: String
  -> Domable
progress__ t = progress_ [ DC.text_ t ]
