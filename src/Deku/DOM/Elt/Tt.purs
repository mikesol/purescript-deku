module Deku.DOM.Elt.Tt where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

tt
  :: Array (Event (Attribute Tags.Tt_))
  -> Array Nut
  -> Nut
tt = DC.elementify3 "tt"

tt_
  :: Array Nut
  -> Nut
tt_ = tt empty

tt__
  :: String
  -> Nut
tt__ t = tt_ [ DC.text_ t ]
