module Deku.DOM.Elt.Tfoot where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Tfoot_

tfoot
  :: Event (Attribute Tfoot_)
  -> Array Domable
  -> Domable
tfoot = DC.elementify2 "tfoot"

tfoot_
  :: Array Domable
  -> Domable
tfoot_ = tfoot empty

tfoot__
  :: String
  -> Domable
tfoot__ t = tfoot_ [ DC.text_ t ]
