module Deku.DOM.Elt.FeDropShadow where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data FeDropShadow_

feDropShadow
  :: Array (Event (Attribute FeDropShadow_))
  -> Array Nut
  -> Nut
feDropShadow = DC.elementify2 "feDropShadow"

feDropShadow_
  :: Array Nut
  -> Nut
feDropShadow_ = feDropShadow empty

feDropShadow__
  :: String
  -> Nut
feDropShadow__ t = feDropShadow_ [ DC.text_ t ]
