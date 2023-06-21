module Deku.DOM.Elt.Strike where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

strike
  :: Array (Attribute Tags.Strike_)
  -> Array Nut
  -> Nut
strike = DC.elementify3 "strike"

strike_
  :: Array Nut
  -> Nut
strike_ = strike empty

strike__
  :: String
  -> Nut
strike__ t = strike_ [ DC.text_ t ]
