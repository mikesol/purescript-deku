module Deku.DOM.Attr.K3 where

import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data K3 = K3

instance Attr FeComposite_ K3 String where
  attr K3 value = unsafeAttribute { key: "k3", value: prop' value }