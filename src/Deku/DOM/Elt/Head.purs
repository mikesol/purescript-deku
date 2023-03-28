module Deku.DOM.Elt.Head where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Head_

head
  :: Event (Attribute Head_)
  -> Array Domable
  -> Domable
head = DC.elementify2 "head"

head_
  :: Array Domable
  -> Domable
head_ = head empty

head__
  :: String
  -> Domable
head__ t = head_ [ DC.text_ t ]
