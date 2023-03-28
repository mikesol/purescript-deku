module Deku.DOM.Elt.FeFuncR where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeFuncR_

feFuncR
  :: Event (Attribute FeFuncR_)
  -> Array Domable
  -> Domable
feFuncR = DC.elementify2 "feFuncR"

feFuncR_
  :: Array Domable
  -> Domable
feFuncR_ = feFuncR empty

feFuncR__
  :: String
  -> Domable
feFuncR__ t = feFuncR_ [ DC.text_ t ]
