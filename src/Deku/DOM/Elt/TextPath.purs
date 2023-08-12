module Deku.DOM.Elt.TextPath where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data TextPath_

textPath
  :: Array (Event (Attribute TextPath_))
  -> Array Nut
  -> Nut
textPath = DC.elementify2 "textPath"

textPath_
  :: Array Nut
  -> Nut
textPath_ = textPath empty

textPath__
  :: String
  -> Nut
textPath__ t = textPath_ [ DC.text_ t ]
