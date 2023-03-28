module Deku.DOM.Elt.Html where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Html_

html
  :: Event (Attribute Html_)
  -> Array Domable
  -> Domable
html = DC.elementify2 "html"

html_
  :: Array Domable
  -> Domable
html_ = html empty

html__
  :: String
  -> Domable
html__ t = html_ [ DC.text_ t ]
