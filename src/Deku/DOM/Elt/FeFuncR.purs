module Deku.DOM.Elt.FeFuncR where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

feFuncR
  :: Array (Event (Attribute Tags.FeFuncR_))
  -> Array Nut
  -> Nut
feFuncR = DC.elementify3 "feFuncR"

feFuncR_
  :: Array Nut
  -> Nut
feFuncR_ = feFuncR empty

feFuncR__
  :: String
  -> Nut
feFuncR__ t = feFuncR_ [ DC.text_ t ]
