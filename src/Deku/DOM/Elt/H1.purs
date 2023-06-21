module Deku.DOM.Elt.H1 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

h1
  :: Array (Attribute Tags.H1_)
  -> Array Nut
  -> Nut
h1 = DC.elementify3 "h1"

h1_
  :: Array Nut
  -> Nut
h1_ = h1 empty

h1__
  :: String
  -> Nut
h1__ t = h1_ [ DC.text_ t ]
