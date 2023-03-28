module Deku.DOM.Elt.ForeignObject where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data ForeignObject_

foreignObject
  :: Event (Attribute ForeignObject_)
  -> Array Domable
  -> Domable
foreignObject = DC.elementify2 "foreignObject"

foreignObject_
  :: Array Domable
  -> Domable
foreignObject_ = foreignObject empty

foreignObject__
  :: String
  -> Domable
foreignObject__ t = foreignObject_ [ DC.text_ t ]
