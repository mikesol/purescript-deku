module Deku.DOM.Elt.Dl where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

dl
  :: Array (Event (Attribute Tags.Dl_))
  -> Array Nut
  -> Nut
dl = DC.elementify3 "dl"

dl_
  :: Array Nut
  -> Nut
dl_ = dl empty

dl__
  :: String
  -> Nut
dl__ t = dl_ [ DC.text_ t ]
