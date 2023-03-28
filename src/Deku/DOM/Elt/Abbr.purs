module Deku.DOM.Elt.Abbr where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Abbr_

abbr
  :: Event (Attribute Abbr_)
  -> Array Domable
  -> Domable
abbr = DC.elementify2 "abbr"

abbr_
  :: Array Domable
  -> Domable
abbr_ = abbr empty

abbr__
  :: String
  -> Domable
abbr__ t = abbr_ [ DC.text_ t ]
