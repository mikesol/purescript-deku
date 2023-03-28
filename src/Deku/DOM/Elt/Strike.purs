module Deku.DOM.Elt.Strike where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Strike_

strike
  :: Event (Attribute Strike_)
  -> Array Domable
  -> Domable
strike = DC.elementify2 "strike"

strike_
  :: Array Domable
  -> Domable
strike_ = strike empty

strike__
  :: String
  -> Domable
strike__ t = strike_ [ DC.text_ t ]
