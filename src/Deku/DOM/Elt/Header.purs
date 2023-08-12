module Deku.DOM.Elt.Header where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Header_

header
  :: Array (Event (Attribute Header_))
  -> Array Nut
  -> Nut
header = DC.elementify2 "header"

header_
  :: Array Nut
  -> Nut
header_ = header empty

header__
  :: String
  -> Nut
header__ t = header_ [ DC.text_ t ]
