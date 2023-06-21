module Deku.DOM.Elt.Pattern where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

pattern
  :: Array (Attribute Tags.Pattern_)
  -> Array Nut
  -> Nut
pattern = DC.elementify3 "pattern"

pattern_
  :: Array Nut
  -> Nut
pattern_ = pattern empty

pattern__
  :: String
  -> Nut
pattern__ t = pattern_ [ DC.text_ t ]
