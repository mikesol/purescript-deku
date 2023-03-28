module Deku.DOM.Elt.FeDropShadow where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeDropShadow_

feDropShadow
  :: Event (Attribute FeDropShadow_)
  -> Array Domable
  -> Domable
feDropShadow = DC.elementify2 "feDropShadow"

feDropShadow_
  :: Array Domable
  -> Domable
feDropShadow_ = feDropShadow empty

feDropShadow__
  :: String
  -> Domable
feDropShadow__ t = feDropShadow_ [ DC.text_ t ]
