module Deku.DOM.Elt.Wbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

wbr
  :: Array (Event (Attribute Tags.Wbr_))
  -> Array Nut
  -> Nut
wbr = DC.elementify3 "wbr"

wbr_
  :: Array Nut
  -> Nut
wbr_ = wbr empty

wbr__
  :: String
  -> Nut
wbr__ t = wbr_ [ DC.text_ t ]
