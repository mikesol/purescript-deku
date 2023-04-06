module Deku.DOM.Elt.Basefont where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Basefont_

basefont
  :: Array (Event (Attribute Basefont_))
  -> Array Nut
  -> Nut
basefont = DC.elementify2 "basefont"

basefont_
  :: Array Nut
  -> Nut
basefont_ = basefont empty

basefont__
  :: String
  -> Nut
basefont__ t = basefont_ [ DC.text_ t ]
