module Deku.DOM.Elt.Style where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

data Style_

style
  :: Array (Attribute Style_)
  -> Array Nut
  -> Nut
style = DC.elementify2 "style"

style_
  :: Array Nut
  -> Nut
style_ = style empty

style__
  :: String
  -> Nut
style__ t = style_ [ DC.text_ t ]
