module Deku.DOM.Elt.Dl where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Dl_

dl
  :: Event (Attribute Dl_)
  -> Array Domable
  -> Domable
dl = DC.elementify2 "dl"

dl_
  :: Array Domable
  -> Domable
dl_ = dl empty

dl__
  :: String
  -> Domable
dl__ t = dl_ [ DC.text_ t ]
