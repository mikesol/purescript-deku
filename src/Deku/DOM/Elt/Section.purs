module Deku.DOM.Elt.Section where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Section_

section
  :: Event (Attribute Section_)
  -> Array Domable
  -> Domable
section = DC.elementify2 "section"

section_
  :: Array Domable
  -> Domable
section_ = section empty

section__
  :: String
  -> Domable
section__ t = section_ [ DC.text_ t ]
