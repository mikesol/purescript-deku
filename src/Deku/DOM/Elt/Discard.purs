module Deku.DOM.Elt.Discard where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Discard_

discard
  :: Array (Event (Attribute Discard_))
  -> Array Nut
  -> Nut
discard = DC.elementify2 "discard"

discard_
  :: Array Nut
  -> Nut
discard_ = discard empty

discard__
  :: String
  -> Nut
discard__ t = discard_ [ DC.text_ t ]
