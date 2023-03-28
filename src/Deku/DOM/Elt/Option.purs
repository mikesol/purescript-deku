module Deku.DOM.Elt.Option where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Option_

option
  :: Event (Attribute Option_)
  -> Array Domable
  -> Domable
option = DC.elementify2 "option"

option_
  :: Array Domable
  -> Domable
option_ = option empty

option__
  :: String
  -> Domable
option__ t = option_ [ DC.text_ t ]
