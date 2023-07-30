module Deku.DOM.Elt.Html where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)


data Html_

html
  :: Array (Attribute Html_)
  -> Array Nut
  -> Nut
html = DC.elementify2 "html"

html_
  :: Array Nut
  -> Nut
html_ = html empty

html__
  :: String
  -> Nut
html__ t = html_ [ DC.text_ t ]
