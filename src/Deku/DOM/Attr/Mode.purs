module Deku.DOM.Attr.Mode where

import Prelude

import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Mode = Mode

instance Attr FeBlend_ Mode String where
  attr Mode value = unsafeAttribute { key: "mode", value: prop' value }

instance Attr everything Mode Unit where
  attr Mode _ = unsafeAttribute
    { key: "mode", value: unset' }
