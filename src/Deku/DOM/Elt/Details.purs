module Deku.DOM.Elt.Details where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

details
  :: Array (Attribute Tags.Details_)
  -> Array Nut
  -> Nut
details = DC.elementify3 "details"

details_
  :: Array Nut
  -> Nut
details_ = details empty

details__
  :: String
  -> Nut
details__ t = details_ [ DC.text_ t ]
