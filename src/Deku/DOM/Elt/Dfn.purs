module Deku.DOM.Elt.Dfn where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

dfn
  :: Array (Attribute Tags.Dfn_)
  -> Array Nut
  -> Nut
dfn = DC.elementify3 "dfn"

dfn_
  :: Array Nut
  -> Nut
dfn_ = dfn empty

dfn__
  :: String
  -> Nut
dfn__ t = dfn_ [ DC.text_ t ]
