module Deku.DOM.Elt.Text where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Text_

text
  :: Event (Attribute Text_)
  -> Array Domable
  -> Domable
text = DC.elementify2 "text"

text_
  :: Array Domable
  -> Domable
text_ = text empty

text__
  :: String
  -> Domable
text__ t = text_ [ DC.text_ t ]
