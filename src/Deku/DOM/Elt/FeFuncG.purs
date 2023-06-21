module Deku.DOM.Elt.FeFuncG where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

feFuncG
  :: Array (Event (Attribute Tags.FeFuncG_))
  -> Array Nut
  -> Nut
feFuncG = DC.elementify3 "feFuncG"

feFuncG_
  :: Array Nut
  -> Nut
feFuncG_ = feFuncG empty

feFuncG__
  :: String
  -> Nut
feFuncG__ t = feFuncG_ [ DC.text_ t ]
