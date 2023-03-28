module Deku.DOM.Elt.Summary where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Summary_

summary
  :: Event (Attribute Summary_)
  -> Array Domable
  -> Domable
summary = DC.elementify2 "summary"

summary_
  :: Array Domable
  -> Domable
summary_ = summary empty

summary__
  :: String
  -> Domable
summary__ t = summary_ [ DC.text_ t ]
