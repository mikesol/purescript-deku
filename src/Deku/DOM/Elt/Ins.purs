module Deku.DOM.Elt.Ins where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Ins_

ins
  :: Event (Attribute Ins_)
  -> Array Domable
  -> Domable
ins = DC.elementify2 "ins"

ins_
  :: Array Domable
  -> Domable
ins_ = ins empty

ins__
  :: String
  -> Domable
ins__ t = ins_ [ DC.text_ t ]
