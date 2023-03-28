module Deku.DOM.Elt.Acronym where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Acronym_

acronym
  :: Event (Attribute Acronym_)
  -> Array Domable
  -> Domable
acronym = DC.elementify2 "acronym"

acronym_
  :: Array Domable
  -> Domable
acronym_ = acronym empty

acronym__
  :: String
  -> Domable
acronym__ t = acronym_ [ DC.text_ t ]
