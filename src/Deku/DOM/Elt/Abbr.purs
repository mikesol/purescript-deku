module Deku.DOM.Elt.Abbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

abbr
  :: Array (Attribute Tags.Abbr_)
  -> Array Nut
  -> Nut
abbr = DC.elementify3 "abbr"

abbr_
  :: Array Nut
  -> Nut
abbr_ = abbr empty

abbr__
  :: String
  -> Nut
abbr__ t = abbr_ [ DC.text_ t ]
