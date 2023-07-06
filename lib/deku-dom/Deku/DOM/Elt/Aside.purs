module Deku.DOM.Elt.Aside where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Aside_

aside
  :: Array (Event (Attribute Aside_))
  -> Array Nut
  -> Nut
aside = DC.elementify2 "aside"

aside_
  :: Array Nut
  -> Nut
aside_ = aside empty

aside__
  :: String
  -> Nut
aside__ t = aside_ [ DC.text_ t ]
