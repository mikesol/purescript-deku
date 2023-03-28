module Deku.DOM.Elt.FeFuncG where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeFuncG_

feFuncG
  :: Event (Attribute FeFuncG_)
  -> Array Domable
  -> Domable
feFuncG = DC.elementify2 "feFuncG"

feFuncG_
  :: Array Domable
  -> Domable
feFuncG_ = feFuncG empty

feFuncG__
  :: String
  -> Domable
feFuncG__ t = feFuncG_ [ DC.text_ t ]
