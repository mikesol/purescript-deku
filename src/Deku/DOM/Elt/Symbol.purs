module Deku.DOM.Elt.Symbol where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Symbol_

symbol
  :: Array (Event (Attribute Symbol_))
  -> Array Nut
  -> Nut
symbol = DC.elementify2 "symbol"

symbol_
  :: Array Nut
  -> Nut
symbol_ = symbol empty

symbol__
  :: String
  -> Nut
symbol__ t = symbol_ [ DC.text_ t ]
