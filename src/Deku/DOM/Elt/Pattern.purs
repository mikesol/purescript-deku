module Deku.DOM.Elt.Pattern where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Pattern_

pattern
  :: Event (Attribute Pattern_)
  -> Array Domable
  -> Domable
pattern = DC.elementify2 "pattern"

pattern_
  :: Array Domable
  -> Domable
pattern_ = pattern empty

pattern__
  :: String
  -> Domable
pattern__ t = pattern_ [ DC.text_ t ]
