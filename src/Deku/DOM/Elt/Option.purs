module Deku.DOM.Elt.Option where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

option
  :: Array (Event (Attribute Tags.Option_))
  -> Array Nut
  -> Nut
option = DC.elementify3 "option"

option_
  :: Array Nut
  -> Nut
option_ = option empty

option__
  :: String
  -> Nut
option__ t = option_ [ DC.text_ t ]
