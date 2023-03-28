module Deku.DOM.Elt.Ul where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Ul_

ul
  :: Event (Attribute Ul_)
  -> Array Domable
  -> Domable
ul = DC.elementify2 "ul"

ul_
  :: Array Domable
  -> Domable
ul_ = ul empty

ul__
  :: String
  -> Domable
ul__ t = ul_ [ DC.text_ t ]
