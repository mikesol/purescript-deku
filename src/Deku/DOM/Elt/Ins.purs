module Deku.DOM.Elt.Ins where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

ins
  :: Array (Event (Attribute Tags.Ins_))
  -> Array Nut
  -> Nut
ins = DC.elementify3 "ins"

ins_
  :: Array Nut
  -> Nut
ins_ = ins empty

ins__
  :: String
  -> Nut
ins__ t = ins_ [ DC.text_ t ]
