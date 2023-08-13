module Deku.DOM.Elt.Summary where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Summary_

summary
  :: Array (Poll (Attribute Summary_))
  -> Array Nut
  -> Nut
summary = DC.elementify2 "summary"

summary_
  :: Array Nut
  -> Nut
summary_ = summary empty

summary__
  :: String
  -> Nut
summary__ t = summary_ [ DC.text_ t ]
