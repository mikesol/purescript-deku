module Deku.DOM.Elt.Big where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

big
  :: Array (Attribute Tags.Big_)
  -> Array Nut
  -> Nut
big = DC.elementify3 "big"

big_
  :: Array Nut
  -> Nut
big_ = big empty

big__
  :: String
  -> Nut
big__ t = big_ [ DC.text_ t ]
