module Deku.DOM.Elt.Mask where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Mask_

mask
  :: Event (Attribute Mask_)
  -> Array Domable
  -> Domable
mask = DC.elementify2 "mask"

mask_
  :: Array Domable
  -> Domable
mask_ = mask empty

mask__
  :: String
  -> Domable
mask__ t = mask_ [ DC.text_ t ]
