module Deku.DOM.Elt.Base where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

base
  :: Array (Event (Attribute Tags.Base_))
  -> Array Nut
  -> Nut
base = DC.elementify3 "base"

base_
  :: Array Nut
  -> Nut
base_ = base empty

base__
  :: String
  -> Nut
base__ t = base_ [ DC.text_ t ]
