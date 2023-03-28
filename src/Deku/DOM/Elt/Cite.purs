module Deku.DOM.Elt.Cite where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Cite_

cite
  :: Event (Attribute Cite_)
  -> Array Domable
  -> Domable
cite = DC.elementify2 "cite"

cite_
  :: Array Domable
  -> Domable
cite_ = cite empty

cite__
  :: String
  -> Domable
cite__ t = cite_ [ DC.text_ t ]
