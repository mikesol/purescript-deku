module Deku.DOM.Elt.Dd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

dd
  :: Array (Attribute Tags.Dd_)
  -> Array Nut
  -> Nut
dd = DC.elementify3 "dd"

dd_
  :: Array Nut
  -> Nut
dd_ = dd empty

dd__
  :: String
  -> Nut
dd__ t = dd_ [ DC.text_ t ]
