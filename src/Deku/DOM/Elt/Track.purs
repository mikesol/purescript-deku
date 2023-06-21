module Deku.DOM.Elt.Track where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

track
  :: Array (Attribute Tags.Track_)
  -> Array Nut
  -> Nut
track = DC.elementify3 "track"

track_
  :: Array Nut
  -> Nut
track_ = track empty

track__
  :: String
  -> Nut
track__ t = track_ [ DC.text_ t ]
