module Deku.DOM.Attr.K2 where

import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data K2 = K2

instance Attr FeComposite_ K2 String where
  attr K2 value = unsafeAttribute { key: "k2", value: prop' value }