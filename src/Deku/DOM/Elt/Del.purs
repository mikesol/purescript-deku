module Deku.DOM.Elt.Del where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Del_

del
  :: Event (Attribute Del_)
  -> Array Domable
  -> Domable
del = DC.elementify2 "del"

del_
  :: Array Domable
  -> Domable
del_ = del empty

del__
  :: String
  -> Domable
del__ t = del_ [ DC.text_ t ]
