module Deku.DOM.Elt.Set where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

set
  :: Array (Attribute Tags.Set_)
  -> Array Nut
  -> Nut
set = DC.elementify3 "set"

set_
  :: Array Nut
  -> Nut
set_ = set empty

set__
  :: String
  -> Nut
set__ t = set_ [ DC.text_ t ]
