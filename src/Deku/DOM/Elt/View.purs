module Deku.DOM.Elt.View where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

view
  :: Array (Attribute Tags.View_)
  -> Array Nut
  -> Nut
view = DC.elementify3 "view"

view_
  :: Array Nut
  -> Nut
view_ = view empty

view__
  :: String
  -> Nut
view__ t = view_ [ DC.text_ t ]
