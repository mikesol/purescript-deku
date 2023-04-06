module Deku.DOM.Elt.Frameset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Frameset_

frameset
  :: Array (Event (Attribute Frameset_))
  -> Array Nut
  -> Nut
frameset = DC.elementify2 "frameset"

frameset_
  :: Array Nut
  -> Nut
frameset_ = frameset empty

frameset__
  :: String
  -> Nut
frameset__ t = frameset_ [ DC.text_ t ]
