module Deku.DOM.Elt.TextPath where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data TextPath_

textPath
  :: Event (Attribute TextPath_)
  -> Array Domable
  -> Domable
textPath = DC.elementify2 "textPath"

textPath_
  :: Array Domable
  -> Domable
textPath_ = textPath empty

textPath__
  :: String
  -> Domable
textPath__ t = textPath_ [ DC.text_ t ]
