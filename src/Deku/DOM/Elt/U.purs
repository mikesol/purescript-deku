module Deku.DOM.Elt.U where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

u
  :: Array (Attribute Tags.U_)
  -> Array Nut
  -> Nut
u = DC.elementify3 "u"

u_
  :: Array Nut
  -> Nut
u_ = u empty

u__
  :: String
  -> Nut
u__ t = u_ [ DC.text_ t ]
