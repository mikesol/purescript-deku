module Deku.DOM.Elt.Dd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Dd_

dd
  :: Event (Attribute Dd_)
  -> Array Nut
  -> Nut
dd = DC.elementify2 "dd"

dd_
  :: Array Nut
  -> Nut
dd_ = dd empty

dd__
  :: String
  -> Nut
dd__ t = dd_ [ DC.text_ t ]
