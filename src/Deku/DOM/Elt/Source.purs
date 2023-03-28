module Deku.DOM.Elt.Source where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Source_

source
  :: Event (Attribute Source_)
  -> Array Domable
  -> Domable
source = DC.elementify2 "source"

source_
  :: Array Domable
  -> Domable
source_ = source empty

source__
  :: String
  -> Domable
source__ t = source_ [ DC.text_ t ]
