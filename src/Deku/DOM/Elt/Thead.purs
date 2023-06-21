module Deku.DOM.Elt.Thead where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

thead
  :: Array (Attribute Tags.Thead_)
  -> Array Nut
  -> Nut
thead = DC.elementify3 "thead"

thead_
  :: Array Nut
  -> Nut
thead_ = thead empty

thead__
  :: String
  -> Nut
thead__ t = thead_ [ DC.text_ t ]
