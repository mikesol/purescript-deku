module Deku.DOM.Attr.K4 where

import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data K4 = K4

instance Attr FeComposite_ K4 String where
  attr K4 value = unsafeAttribute { key: "k4", value: prop' value }