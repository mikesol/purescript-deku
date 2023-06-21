module Deku.DOM.Elt.Hr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

hr
  :: Array (Attribute Tags.Hr_)
  -> Array Nut
  -> Nut
hr = DC.elementify3 "hr"

hr_
  :: Array Nut
  -> Nut
hr_ = hr empty

hr__
  :: String
  -> Nut
hr__ t = hr_ [ DC.text_ t ]
