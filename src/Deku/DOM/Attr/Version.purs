module Deku.DOM.Attr.Version where

import Prelude

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Version = Version

instance Attr Svg_ Version String where
  attr Version value = unsafeAttribute { key: "version", value: prop' value }

instance Attr everything Version Unit where
  attr Version _ = unsafeAttribute
    { key: "version", value: unset' }
