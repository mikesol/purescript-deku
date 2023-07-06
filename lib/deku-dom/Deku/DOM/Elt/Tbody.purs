module Deku.DOM.Elt.Tbody where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Tbody_

tbody
  :: Array (Event (Attribute Tbody_))
  -> Array Nut
  -> Nut
tbody = DC.elementify2 "tbody"

tbody_
  :: Array Nut
  -> Nut
tbody_ = tbody empty

tbody__
  :: String
  -> Nut
tbody__ t = tbody_ [ DC.text_ t ]
