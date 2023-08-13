module Deku.DOM.Elt.Code where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Code_

code
  :: Array (Poll (Attribute Code_))
  -> Array Nut
  -> Nut
code = DC.elementify2 "code"

code_
  :: Array Nut
  -> Nut
code_ = code empty

code__
  :: String
  -> Nut
code__ t = code_ [ DC.text_ t ]
