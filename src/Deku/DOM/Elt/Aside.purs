module Deku.DOM.Elt.Aside where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Aside_

aside
  :: Event (Attribute Aside_)
  -> Array Domable
  -> Domable
aside = DC.elementify2 "aside"

aside_
  :: Array Domable
  -> Domable
aside_ = aside empty

aside__
  :: String
  -> Domable
aside__ t = aside_ [ DC.text_ t ]
