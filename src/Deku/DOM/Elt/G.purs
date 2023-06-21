module Deku.DOM.Elt.G where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

g
  :: Array (Attribute Tags.G_)
  -> Array Nut
  -> Nut
g = DC.elementify3 "g"

g_
  :: Array Nut
  -> Nut
g_ = g empty

g__
  :: String
  -> Nut
g__ t = g_ [ DC.text_ t ]
