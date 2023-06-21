module Deku.DOM.Elt.Html where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

html
  :: Array (Event (Attribute Tags.Html_))
  -> Array Nut
  -> Nut
html = DC.elementify3 "html"

html_
  :: Array Nut
  -> Nut
html_ = html empty

html__
  :: String
  -> Nut
html__ t = html_ [ DC.text_ t ]
