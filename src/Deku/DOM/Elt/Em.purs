module Deku.DOM.Elt.Em where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Em_

em
  :: Event (Attribute Em_)
  -> Array Domable
  -> Domable
em = DC.elementify2 "em"

em_
  :: Array Domable
  -> Domable
em_ = em empty

em__
  :: String
  -> Domable
em__ t = em_ [ DC.text_ t ]
