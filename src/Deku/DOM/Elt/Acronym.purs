module Deku.DOM.Elt.Acronym where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Acronym_

acronym
  :: Array (Event (Attribute Acronym_))
  -> Array Nut
  -> Nut
acronym = DC.elementify2 "acronym"

acronym_
  :: Array Nut
  -> Nut
acronym_ = acronym empty

acronym__
  :: String
  -> Nut
acronym__ t = acronym_ [ DC.text_ t ]
