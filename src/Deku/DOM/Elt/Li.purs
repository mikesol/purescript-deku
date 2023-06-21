module Deku.DOM.Elt.Li where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

li
  :: Array (Attribute Tags.Li_)
  -> Array Nut
  -> Nut
li = DC.elementify3 "li"

li_
  :: Array Nut
  -> Nut
li_ = li empty

li__
  :: String
  -> Nut
li__ t = li_ [ DC.text_ t ]
