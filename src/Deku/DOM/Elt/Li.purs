module Deku.DOM.Elt.Li where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Li_

li
  :: Event (Attribute Li_)
  -> Array Domable
  -> Domable
li = DC.elementify2 "li"

li_
  :: Array Domable
  -> Domable
li_ = li empty

li__
  :: String
  -> Domable
li__ t = li_ [ DC.text_ t ]
