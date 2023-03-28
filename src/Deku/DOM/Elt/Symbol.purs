module Deku.DOM.Elt.Symbol where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Symbol_

symbol
  :: Event (Attribute Symbol_)
  -> Array Domable
  -> Domable
symbol = DC.elementify2 "symbol"

symbol_
  :: Array Domable
  -> Domable
symbol_ = symbol empty

symbol__
  :: String
  -> Domable
symbol__ t = symbol_ [ DC.text_ t ]
