module Deku.DOM.Elt.A where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

a
  :: Array (Event (Attribute Tags.A_))
  -> Array Nut
  -> Nut
a = DC.elementify3 "a"

a_
  :: Array Nut
  -> Nut
a_ = a empty

a__
  :: String
  -> Nut
a__ t = a_ [ DC.text_ t ]
