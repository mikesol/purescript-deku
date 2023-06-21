module Deku.DOM.Elt.Line where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

line
  :: Array (Attribute Tags.Line_)
  -> Array Nut
  -> Nut
line = DC.elementify3 "line"

line_
  :: Array Nut
  -> Nut
line_ = line empty

line__
  :: String
  -> Nut
line__ t = line_ [ DC.text_ t ]
