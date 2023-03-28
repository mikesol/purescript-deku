module Deku.DOM.Elt.Script where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Script_

script
  :: Event (Attribute Script_)
  -> Array Domable
  -> Domable
script = DC.elementify2 "script"

script_
  :: Array Domable
  -> Domable
script_ = script empty

script__
  :: String
  -> Domable
script__ t = script_ [ DC.text_ t ]
