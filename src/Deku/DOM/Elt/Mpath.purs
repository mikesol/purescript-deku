module Deku.DOM.Elt.Mpath where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

mpath
  :: Array (Event (Attribute Tags.Mpath_))
  -> Array Nut
  -> Nut
mpath = DC.elementify3 "mpath"

mpath_
  :: Array Nut
  -> Nut
mpath_ = mpath empty

mpath__
  :: String
  -> Nut
mpath__ t = mpath_ [ DC.text_ t ]
