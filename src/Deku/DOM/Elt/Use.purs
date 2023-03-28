module Deku.DOM.Elt.Use where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Use_

use
  :: Event (Attribute Use_)
  -> Array Domable
  -> Domable
use = DC.elementify2 "use"

use_
  :: Array Domable
  -> Domable
use_ = use empty

use__
  :: String
  -> Domable
use__ t = use_ [ DC.text_ t ]
