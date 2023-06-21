module Deku.DOM.Elt.Code where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

code
  :: Array (Attribute Tags.Code_)
  -> Array Nut
  -> Nut
code = DC.elementify3 "code"

code_
  :: Array Nut
  -> Nut
code_ = code empty

code__
  :: String
  -> Nut
code__ t = code_ [ DC.text_ t ]
