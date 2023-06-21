module Deku.DOM.Elt.Dir where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

dir
  :: Array (Event (Attribute Tags.Dir_))
  -> Array Nut
  -> Nut
dir = DC.elementify3 "dir"

dir_
  :: Array Nut
  -> Nut
dir_ = dir empty

dir__
  :: String
  -> Nut
dir__ t = dir_ [ DC.text_ t ]
