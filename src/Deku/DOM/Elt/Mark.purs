module Deku.DOM.Elt.Mark where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

mark
  :: Array (Attribute Tags.Mark_)
  -> Array Nut
  -> Nut
mark = DC.elementify3 "mark"

mark_
  :: Array Nut
  -> Nut
mark_ = mark empty

mark__
  :: String
  -> Nut
mark__ t = mark_ [ DC.text_ t ]
