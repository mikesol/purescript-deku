module Deku.DOM.Elt.FeDropShadow where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

feDropShadow
  :: Array (Event (Attribute Tags.FeDropShadow_))
  -> Array Nut
  -> Nut
feDropShadow = DC.elementify3 "feDropShadow"

feDropShadow_
  :: Array Nut
  -> Nut
feDropShadow_ = feDropShadow empty

feDropShadow__
  :: String
  -> Nut
feDropShadow__ t = feDropShadow_ [ DC.text_ t ]
