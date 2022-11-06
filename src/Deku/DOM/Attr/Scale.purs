module Deku.DOM.Attr.Scale where

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Scale = Scale

instance Attr FeDisplacementMap_ Scale String where
  attr Scale value = unsafeAttribute { key: "scale", value: prop' value }