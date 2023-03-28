module Deku.DOM.Elt.Discard where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Discard_

discard
  :: Event (Attribute Discard_)
  -> Array Domable
  -> Domable
discard = DC.elementify2 "discard"

discard_
  :: Array Domable
  -> Domable
discard_ = discard empty

discard__
  :: String
  -> Domable
discard__ t = discard_ [ DC.text_ t ]
