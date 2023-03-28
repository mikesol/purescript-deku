module Deku.DOM.Elt.Tr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Tr_

tr
  :: Event (Attribute Tr_)
  -> Array Domable
  -> Domable
tr = DC.elementify2 "tr"

tr_
  :: Array Domable
  -> Domable
tr_ = tr empty

tr__
  :: String
  -> Domable
tr__ t = tr_ [ DC.text_ t ]
