module Deku.DOM.Elt.Defs where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

defs
  :: Array (Attribute Tags.Defs_)
  -> Array Nut
  -> Nut
defs = DC.elementify3 "defs"

defs_
  :: Array Nut
  -> Nut
defs_ = defs empty

defs__
  :: String
  -> Nut
defs__ t = defs_ [ DC.text_ t ]
