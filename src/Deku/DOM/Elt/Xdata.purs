module Deku.DOM.Elt.Xdata where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

xdata
  :: Array (Attribute Tags.Xdata_)
  -> Array Nut
  -> Nut
xdata = DC.elementify3 "data"

xdata_
  :: Array Nut
  -> Nut
xdata_ = xdata empty

xdata__
  :: String
  -> Nut
xdata__ t = xdata_ [ DC.text_ t ]
