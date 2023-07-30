module Deku.DOM.Elt.Option where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data Option_

option
  :: Array (Attribute Option_)
  -> Array Nut
  -> Nut
option = DC.elementify2 "option"

option_
  :: Array Nut
  -> Nut
option_ = option empty

option__
  :: String
  -> Nut
option__ t = option_ [ DC.text_ t ]
