module Deku.DOM.Elt.Header where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Header_

header
  :: Event (Attribute Header_)
  -> Array Domable
  -> Domable
header = DC.elementify2 "header"

header_
  :: Array Domable
  -> Domable
header_ = header empty

header__
  :: String
  -> Domable
header__ t = header_ [ DC.text_ t ]
