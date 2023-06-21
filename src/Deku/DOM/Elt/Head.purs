module Deku.DOM.Elt.Head where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

head
  :: Array (Event (Attribute Tags.Head_))
  -> Array Nut
  -> Nut
head = DC.elementify3 "head"

head_
  :: Array Nut
  -> Nut
head_ = head empty

head__
  :: String
  -> Nut
head__ t = head_ [ DC.text_ t ]
