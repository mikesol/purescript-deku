module Deku.DOM.Attr.Version where

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Version = Version

instance Attr Svg_ Version String where
  attr Version value = unsafeAttribute { key: "version", value: prop' value }