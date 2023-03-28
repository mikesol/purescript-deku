module Deku.DOM.Elt.Hr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Hr_

hr
  :: Event (Attribute Hr_)
  -> Array Domable
  -> Domable
hr = DC.elementify2 "hr"

hr_
  :: Array Domable
  -> Domable
hr_ = hr empty

hr__
  :: String
  -> Domable
hr__ t = hr_ [ DC.text_ t ]
