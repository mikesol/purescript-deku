module Deku.DOM.Elt.Caption where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Caption_

caption
  :: Event (Attribute Caption_)
  -> Array Domable
  -> Domable
caption = DC.elementify2 "caption"

caption_
  :: Array Domable
  -> Domable
caption_ = caption empty

caption__
  :: String
  -> Domable
caption__ t = caption_ [ DC.text_ t ]
