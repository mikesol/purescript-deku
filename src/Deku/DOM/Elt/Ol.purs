module Deku.DOM.Elt.Ol where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Ol_

ol
  :: Array (Event (Attribute Ol_))
  -> Array Nut
  -> Nut
ol = DC.elementify2 "ol"

ol_
  :: Array Nut
  -> Nut
ol_ = ol empty

ol__
  :: String
  -> Nut
ol__ t = ol_ [ DC.text_ t ]
