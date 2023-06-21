module Deku.DOM.Elt.Cite where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

cite
  :: Array (Event (Attribute Tags.Cite_))
  -> Array Nut
  -> Nut
cite = DC.elementify3 "cite"

cite_
  :: Array Nut
  -> Nut
cite_ = cite empty

cite__
  :: String
  -> Nut
cite__ t = cite_ [ DC.text_ t ]
