module Deku.DOM.Elt.Thead where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Thead_

thead
  :: Array (Event (Attribute Thead_))
  -> Array Nut
  -> Nut
thead = DC.elementify2 "thead"

thead_
  :: Array Nut
  -> Nut
thead_ = thead empty

thead__
  :: String
  -> Nut
thead__ t = thead_ [ DC.text_ t ]
