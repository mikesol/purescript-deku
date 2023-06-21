module Deku.DOM.Elt.Del where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

del
  :: Array (Attribute Tags.Del_)
  -> Array Nut
  -> Nut
del = DC.elementify3 "del"

del_
  :: Array Nut
  -> Nut
del_ = del empty

del__
  :: String
  -> Nut
del__ t = del_ [ DC.text_ t ]
