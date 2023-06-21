module Deku.DOM.Elt.Q where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

q
  :: Array (Event (Attribute Tags.Q_))
  -> Array Nut
  -> Nut
q = DC.elementify3 "q"

q_
  :: Array Nut
  -> Nut
q_ = q empty

q__
  :: String
  -> Nut
q__ t = q_ [ DC.text_ t ]
