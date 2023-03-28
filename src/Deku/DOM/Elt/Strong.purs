module Deku.DOM.Elt.Strong where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Strong_

strong
  :: Event (Attribute Strong_)
  -> Array Domable
  -> Domable
strong = DC.elementify2 "strong"

strong_
  :: Array Domable
  -> Domable
strong_ = strong empty

strong__
  :: String
  -> Domable
strong__ t = strong_ [ DC.text_ t ]
