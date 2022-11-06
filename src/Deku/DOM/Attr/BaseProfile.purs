module Deku.DOM.Attr.BaseProfile where

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data BaseProfile = BaseProfile

instance Attr Svg_ BaseProfile String where
  attr BaseProfile value = unsafeAttribute { key: "baseProfile", value: prop' value }