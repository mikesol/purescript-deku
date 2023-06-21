module Deku.DOM.Elt.Tfoot where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

tfoot
  :: Array (Attribute Tags.Tfoot_)
  -> Array Nut
  -> Nut
tfoot = DC.elementify3 "tfoot"

tfoot_
  :: Array Nut
  -> Nut
tfoot_ = tfoot empty

tfoot__
  :: String
  -> Nut
tfoot__ t = tfoot_ [ DC.text_ t ]
