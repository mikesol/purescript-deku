module Deku.DOM.Elt.Del where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Del_

del
  :: Array (Event (Attribute Del_))
  -> Array Nut
  -> Nut
del = DC.elementify2 "del"

del_
  :: Array Nut
  -> Nut
del_ = del empty

del__
  :: String
  -> Nut
del__ t = del_ [ DC.text_ t ]
