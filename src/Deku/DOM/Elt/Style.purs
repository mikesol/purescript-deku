module Deku.DOM.Elt.Style where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Style_

style
  :: Event (Attribute Style_)
  -> Array Domable
  -> Domable
style = DC.elementify2 "style"

style_
  :: Array Domable
  -> Domable
style_ = style empty

style__
  :: String
  -> Domable
style__ t = style_ [ DC.text_ t ]
