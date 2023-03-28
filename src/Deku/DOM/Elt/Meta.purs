module Deku.DOM.Elt.Meta where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Meta_

meta
  :: Event (Attribute Meta_)
  -> Array Domable
  -> Domable
meta = DC.elementify2 "meta"

meta_
  :: Array Domable
  -> Domable
meta_ = meta empty

meta__
  :: String
  -> Domable
meta__ t = meta_ [ DC.text_ t ]
