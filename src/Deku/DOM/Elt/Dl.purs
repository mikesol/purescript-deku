module Deku.DOM.Elt.Dl where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Dl_

dl
  :: Array (Event (Attribute Dl_))
  -> Array Nut
  -> Nut
dl = DC.elementify2 "dl"

dl_
  :: Array Nut
  -> Nut
dl_ = dl empty

dl__
  :: String
  -> Nut
dl__ t = dl_ [ DC.text_ t ]
