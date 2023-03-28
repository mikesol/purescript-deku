module Deku.DOM.Elt.Big where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Big_

big
  :: Event (Attribute Big_)
  -> Array Domable
  -> Domable
big = DC.elementify2 "big"

big_
  :: Array Domable
  -> Domable
big_ = big empty

big__
  :: String
  -> Domable
big__ t = big_ [ DC.text_ t ]
