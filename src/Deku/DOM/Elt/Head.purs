module Deku.DOM.Elt.Head where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Head_

head
  :: Array (Poll (Attribute Head_))
  -> Array Nut
  -> Nut
head = DC.elementify2 "head"

head_
  :: Array Nut
  -> Nut
head_ = head empty

head__
  :: String
  -> Nut
head__ t = head_ [ DC.text_ t ]
