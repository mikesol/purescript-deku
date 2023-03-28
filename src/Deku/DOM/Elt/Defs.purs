module Deku.DOM.Elt.Defs where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Defs_

defs
  :: Event (Attribute Defs_)
  -> Array Domable
  -> Domable
defs = DC.elementify2 "defs"

defs_
  :: Array Domable
  -> Domable
defs_ = defs empty

defs__
  :: String
  -> Domable
defs__ t = defs_ [ DC.text_ t ]
