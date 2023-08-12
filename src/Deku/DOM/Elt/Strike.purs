module Deku.DOM.Elt.Strike where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Strike_

strike
  :: Array (Event (Attribute Strike_))
  -> Array Nut
  -> Nut
strike = DC.elementify2 "strike"

strike_
  :: Array Nut
  -> Nut
strike_ = strike empty

strike__
  :: String
  -> Nut
strike__ t = strike_ [ DC.text_ t ]
