module Deku.DOM.Attr.K1 where

import Prelude

import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data K1 = K1

instance Attr FeComposite_ K1 String where
  attr K1 value = unsafeAttribute { key: "k1", value: prop' value }

instance Attr everything K1 Unit where
  attr K1 _ = unsafeAttribute
    { key: "k1", value: unset' }
