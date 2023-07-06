module Deku.DOM.Elt.Source where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Source_

source
  :: Array (Event (Attribute Source_))
  -> Array Nut
  -> Nut
source = DC.elementify2 "source"

source_
  :: Array Nut
  -> Nut
source_ = source empty

source__
  :: String
  -> Nut
source__ t = source_ [ DC.text_ t ]
