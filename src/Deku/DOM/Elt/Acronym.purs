module Deku.DOM.Elt.Acronym where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

acronym
  :: Array (Event (Attribute Tags.Acronym_))
  -> Array Nut
  -> Nut
acronym = DC.elementify3 "acronym"

acronym_
  :: Array Nut
  -> Nut
acronym_ = acronym empty

acronym__
  :: String
  -> Nut
acronym__ t = acronym_ [ DC.text_ t ]
