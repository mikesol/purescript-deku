module Deku.DOM.Elt.Mark where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Mark_

mark
  :: Event (Attribute Mark_)
  -> Array Domable
  -> Domable
mark = DC.elementify2 "mark"

mark_
  :: Array Domable
  -> Domable
mark_ = mark empty

mark__
  :: String
  -> Domable
mark__ t = mark_ [ DC.text_ t ]
