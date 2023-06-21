module Deku.DOM.Elt.Progress where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

progress
  :: Array (Attribute Tags.Progress_)
  -> Array Nut
  -> Nut
progress = DC.elementify3 "progress"

progress_
  :: Array Nut
  -> Nut
progress_ = progress empty

progress__
  :: String
  -> Nut
progress__ t = progress_ [ DC.text_ t ]
