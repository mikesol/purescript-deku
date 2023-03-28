module Deku.DOM.Elt.Dd where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Dd_

dd
  :: Event (Attribute Dd_)
  -> Array Domable
  -> Domable
dd = DC.elementify2 "dd"

dd_
  :: Array Domable
  -> Domable
dd_ = dd empty

dd__
  :: String
  -> Domable
dd__ t = dd_ [ DC.text_ t ]
