module Deku.DOM.Elt.Ol where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

ol
  :: Array (Attribute Tags.Ol_)
  -> Array Nut
  -> Nut
ol = DC.elementify3 "ol"

ol_
  :: Array Nut
  -> Nut
ol_ = ol empty

ol__
  :: String
  -> Nut
ol__ t = ol_ [ DC.text_ t ]
