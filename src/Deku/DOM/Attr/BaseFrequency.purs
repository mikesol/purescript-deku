module Deku.DOM.Attr.BaseFrequency where

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data BaseFrequency = BaseFrequency

instance Attr FeTurbulence_ BaseFrequency String where
  attr BaseFrequency value = unsafeAttribute
    { key: "baseFrequency", value: prop' value }