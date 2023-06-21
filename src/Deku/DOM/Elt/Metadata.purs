module Deku.DOM.Elt.Metadata where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

metadata
  :: Array (Event (Attribute Tags.Metadata_))
  -> Array Nut
  -> Nut
metadata = DC.elementify3 "metadata"

metadata_
  :: Array Nut
  -> Nut
metadata_ = metadata empty

metadata__
  :: String
  -> Nut
metadata__ t = metadata_ [ DC.text_ t ]
