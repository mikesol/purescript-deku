module Deku.DOM.Elt.Em where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

em
  :: Array (Event (Attribute Tags.Em_))
  -> Array Nut
  -> Nut
em = DC.elementify3 "em"

em_
  :: Array Nut
  -> Nut
em_ = em empty

em__
  :: String
  -> Nut
em__ t = em_ [ DC.text_ t ]
