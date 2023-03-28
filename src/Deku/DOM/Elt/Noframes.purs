module Deku.DOM.Elt.Noframes where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Noframes_

noframes
  :: Event (Attribute Noframes_)
  -> Array Domable
  -> Domable
noframes = DC.elementify2 "noframes"

noframes_
  :: Array Domable
  -> Domable
noframes_ = noframes empty

noframes__
  :: String
  -> Domable
noframes__ t = noframes_ [ DC.text_ t ]
