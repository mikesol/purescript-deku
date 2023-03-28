module Deku.DOM.Elt.Ol where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Ol_

ol
  :: Event (Attribute Ol_)
  -> Array Domable
  -> Domable
ol = DC.elementify2 "ol"

ol_
  :: Array Domable
  -> Domable
ol_ = ol empty

ol__
  :: String
  -> Domable
ol__ t = ol_ [ DC.text_ t ]
