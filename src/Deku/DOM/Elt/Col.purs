module Deku.DOM.Elt.Col where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

col
  :: Array (Event (Attribute Tags.Col_))
  -> Array Nut
  -> Nut
col = DC.elementify3 "col"

col_
  :: Array Nut
  -> Nut
col_ = col empty

col__
  :: String
  -> Nut
col__ t = col_ [ DC.text_ t ]
