module Deku.DOM.Elt.Tbody where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Tbody_

tbody
  :: Event (Attribute Tbody_)
  -> Array Domable
  -> Domable
tbody = DC.elementify2 "tbody"

tbody_
  :: Array Domable
  -> Domable
tbody_ = tbody empty

tbody__
  :: String
  -> Domable
tbody__ t = tbody_ [ DC.text_ t ]
