module Deku.DOM.Attr.Scale where

import Prelude

import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Scale = Scale

instance Attr FeDisplacementMap_ Scale String where
  attr Scale value = unsafeAttribute { key: "scale", value: prop' value }

instance Attr everything Scale Unit where
  attr Scale _ = unsafeAttribute
    { key: "scale", value: unset' }
