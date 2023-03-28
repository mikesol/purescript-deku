module Deku.DOM.Elt.Code where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Code_

code
  :: Event (Attribute Code_)
  -> Array Domable
  -> Domable
code = DC.elementify2 "code"

code_
  :: Array Domable
  -> Domable
code_ = code empty

code__
  :: String
  -> Domable
code__ t = code_ [ DC.text_ t ]
