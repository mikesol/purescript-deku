module Deku.DOM.Elt.FeComposite where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)

import Deku.DOM.Tags as Tags

feComposite
  :: Array (Attribute Tags.FeComposite_)
  -> Array Nut
  -> Nut
feComposite = DC.elementify3 "feComposite"

feComposite_
  :: Array Nut
  -> Nut
feComposite_ = feComposite empty

feComposite__
  :: String
  -> Nut
feComposite__ t = feComposite_ [ DC.text_ t ]
