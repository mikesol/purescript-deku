module Deku.DOM.Elt.Strong where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

strong
  :: Array (Event (Attribute Tags.Strong_))
  -> Array Nut
  -> Nut
strong = DC.elementify3 "strong"

strong_
  :: Array Nut
  -> Nut
strong_ = strong empty

strong__
  :: String
  -> Nut
strong__ t = strong_ [ DC.text_ t ]
