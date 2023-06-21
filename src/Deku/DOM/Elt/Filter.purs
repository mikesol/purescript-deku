module Deku.DOM.Elt.Filter where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

filter
  :: Array (Event (Attribute Tags.Filter_))
  -> Array Nut
  -> Nut
filter = DC.elementify3 "filter"

filter_
  :: Array Nut
  -> Nut
filter_ = filter empty

filter__
  :: String
  -> Nut
filter__ t = filter_ [ DC.text_ t ]
