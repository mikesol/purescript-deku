module Deku.DOM.Elt.Aside where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

aside
  :: Array (Event (Attribute Tags.Aside_))
  -> Array Nut
  -> Nut
aside = DC.elementify3 "aside"

aside_
  :: Array Nut
  -> Nut
aside_ = aside empty

aside__
  :: String
  -> Nut
aside__ t = aside_ [ DC.text_ t ]
