module Deku.DOM.Attr.Mode where

import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Mode = Mode

instance Attr FeBlend_ Mode String where
  attr Mode value = unsafeAttribute { key: "mode", value: prop' value }