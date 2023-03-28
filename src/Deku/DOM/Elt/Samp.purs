module Deku.DOM.Elt.Samp where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Samp_

samp
  :: Event (Attribute Samp_)
  -> Array Domable
  -> Domable
samp = DC.elementify2 "samp"

samp_
  :: Array Domable
  -> Domable
samp_ = samp empty

samp__
  :: String
  -> Domable
samp__ t = samp_ [ DC.text_ t ]
