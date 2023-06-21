module Deku.DOM.Elt.TextPath where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

textPath
  :: Array (Event (Attribute Tags.TextPath_))
  -> Array Nut
  -> Nut
textPath = DC.elementify3 "textPath"

textPath_
  :: Array Nut
  -> Nut
textPath_ = textPath empty

textPath__
  :: String
  -> Nut
textPath__ t = textPath_ [ DC.text_ t ]
