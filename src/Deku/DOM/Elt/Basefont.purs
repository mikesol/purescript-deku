module Deku.DOM.Elt.Basefont where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Basefont_

basefont
  :: Event (Attribute Basefont_)
  -> Array Domable
  -> Domable
basefont = DC.elementify2 "basefont"

basefont_
  :: Array Domable
  -> Domable
basefont_ = basefont empty

basefont__
  :: String
  -> Domable
basefont__ t = basefont_ [ DC.text_ t ]
