module Deku.DOM.Elt.Progress where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data Progress_

progress
  :: Array (Attribute Progress_)
  -> Array Nut
  -> Nut
progress = DC.elementify2 "progress"

progress_
  :: Array Nut
  -> Nut
progress_ = progress empty

progress__
  :: String
  -> Nut
progress__ t = progress_ [ DC.text t ]
