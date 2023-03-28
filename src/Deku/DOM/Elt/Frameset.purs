module Deku.DOM.Elt.Frameset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Frameset_

frameset
  :: Event (Attribute Frameset_)
  -> Array Domable
  -> Domable
frameset = DC.elementify2 "frameset"

frameset_
  :: Array Domable
  -> Domable
frameset_ = frameset empty

frameset__
  :: String
  -> Domable
frameset__ t = frameset_ [ DC.text_ t ]
