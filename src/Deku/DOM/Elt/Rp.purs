module Deku.DOM.Elt.Rp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

rp
  :: Array (Attribute Tags.Rp_)
  -> Array Nut
  -> Nut
rp = DC.elementify3 "rp"

rp_
  :: Array Nut
  -> Nut
rp_ = rp empty

rp__
  :: String
  -> Nut
rp__ t = rp_ [ DC.text_ t ]
