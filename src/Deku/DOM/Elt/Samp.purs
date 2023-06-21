module Deku.DOM.Elt.Samp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

samp
  :: Array (Event (Attribute Tags.Samp_))
  -> Array Nut
  -> Nut
samp = DC.elementify3 "samp"

samp_
  :: Array Nut
  -> Nut
samp_ = samp empty

samp__
  :: String
  -> Nut
samp__ t = samp_ [ DC.text_ t ]
