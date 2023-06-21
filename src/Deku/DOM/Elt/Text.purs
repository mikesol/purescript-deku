module Deku.DOM.Elt.Text where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

text
  :: Array (Event (Attribute Tags.Text_))
  -> Array Nut
  -> Nut
text = DC.elementify3 "text"

text_
  :: Array Nut
  -> Nut
text_ = text empty

text__
  :: String
  -> Nut
text__ t = text_ [ DC.text_ t ]
