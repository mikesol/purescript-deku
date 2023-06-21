module Deku.DOM.Elt.Symbol where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

symbol
  :: Array (Event (Attribute Tags.Symbol_))
  -> Array Nut
  -> Nut
symbol = DC.elementify3 "symbol"

symbol_
  :: Array Nut
  -> Nut
symbol_ = symbol empty

symbol__
  :: String
  -> Nut
symbol__ t = symbol_ [ DC.text_ t ]
