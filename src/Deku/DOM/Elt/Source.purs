module Deku.DOM.Elt.Source where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

source
  :: Array (Event (Attribute Tags.Source_))
  -> Array Nut
  -> Nut
source = DC.elementify3 "source"

source_
  :: Array Nut
  -> Nut
source_ = source empty

source__
  :: String
  -> Nut
source__ t = source_ [ DC.text_ t ]
