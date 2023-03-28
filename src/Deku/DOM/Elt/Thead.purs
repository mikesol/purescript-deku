module Deku.DOM.Elt.Thead where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Thead_

thead
  :: Event (Attribute Thead_)
  -> Array Domable
  -> Domable
thead = DC.elementify2 "thead"

thead_
  :: Array Domable
  -> Domable
thead_ = thead empty

thead__
  :: String
  -> Domable
thead__ t = thead_ [ DC.text_ t ]
