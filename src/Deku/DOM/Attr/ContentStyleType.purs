module Deku.DOM.Attr.ContentStyleType where

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data ContentStyleType = ContentStyleType

instance Attr Svg_ ContentStyleType String where
  attr ContentStyleType value = unsafeAttribute
    { key: "contentStyleType", value: prop' value }