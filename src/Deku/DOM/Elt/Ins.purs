module Deku.DOM.Elt.Ins where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Ins_

ins
  :: Array (Event (Attribute Ins_))
  -> Array Nut
  -> Nut
ins = DC.elementify2 "ins"

ins_
  :: Array Nut
  -> Nut
ins_ = ins empty

ins__
  :: String
  -> Nut
ins__ t = ins_ [ DC.text_ t ]
