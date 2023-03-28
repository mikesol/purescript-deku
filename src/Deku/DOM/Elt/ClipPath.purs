module Deku.DOM.Elt.ClipPath where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data ClipPath_

clipPath
  :: Event (Attribute ClipPath_)
  -> Array Domable
  -> Domable
clipPath = DC.elementify2 "clipPath"

clipPath_
  :: Array Domable
  -> Domable
clipPath_ = clipPath empty

clipPath__
  :: String
  -> Domable
clipPath__ t = clipPath_ [ DC.text_ t ]
