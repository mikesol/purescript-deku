module Deku.DOM.Elt.ForeignObject where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data ForeignObject_

foreignObject
  :: Array (Event (Attribute ForeignObject_))
  -> Array Nut
  -> Nut
foreignObject = DC.elementify2 "foreignObject"

foreignObject_
  :: Array Nut
  -> Nut
foreignObject_ = foreignObject empty

foreignObject__
  :: String
  -> Nut
foreignObject__ t = foreignObject_ [ DC.text_ t ]
