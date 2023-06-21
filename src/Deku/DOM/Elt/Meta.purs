module Deku.DOM.Elt.Meta where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

meta
  :: Array (Attribute Tags.Meta_)
  -> Array Nut
  -> Nut
meta = DC.elementify3 "meta"

meta_
  :: Array Nut
  -> Nut
meta_ = meta empty

meta__
  :: String
  -> Nut
meta__ t = meta_ [ DC.text_ t ]
