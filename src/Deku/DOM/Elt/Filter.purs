module Deku.DOM.Elt.Filter where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Filter_

filter
  :: Event (Attribute Filter_)
  -> Array Domable
  -> Domable
filter = DC.elementify2 "filter"

filter_
  :: Array Domable
  -> Domable
filter_ = filter empty

filter__
  :: String
  -> Domable
filter__ t = filter_ [ DC.text_ t ]
