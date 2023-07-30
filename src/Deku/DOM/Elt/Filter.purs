module Deku.DOM.Elt.Filter where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)


data Filter_

filter
  :: Array (Attribute Filter_)
  -> Array Nut
  -> Nut
filter = DC.elementify2 "filter"

filter_
  :: Array Nut
  -> Nut
filter_ = filter empty

filter__
  :: String
  -> Nut
filter__ t = filter_ [ DC.text_ t ]
