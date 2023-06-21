module Deku.DOM.Elt.Param where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

param
  :: Array (Event (Attribute Tags.Param_))
  -> Array Nut
  -> Nut
param = DC.elementify3 "param"

param_
  :: Array Nut
  -> Nut
param_ = param empty

param__
  :: String
  -> Nut
param__ t = param_ [ DC.text_ t ]
