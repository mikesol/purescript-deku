module Deku.DOM.Elt.Br where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Br_

br
  :: Event (Attribute Br_)
  -> Array Domable
  -> Domable
br = DC.elementify2 "br"

br_
  :: Array Domable
  -> Domable
br_ = br empty

br__
  :: String
  -> Domable
br__ t = br_ [ DC.text_ t ]
