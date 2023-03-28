module Deku.DOM.Elt.FeComposite where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeComposite_

feComposite
  :: Event (Attribute FeComposite_)
  -> Array Domable
  -> Domable
feComposite = DC.elementify2 "feComposite"

feComposite_
  :: Array Domable
  -> Domable
feComposite_ = feComposite empty

feComposite__
  :: String
  -> Domable
feComposite__ t = feComposite_ [ DC.text_ t ]
