module Deku.DOM.Attr.ContentScriptType where

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data ContentScriptType = ContentScriptType

instance Attr Svg_ ContentScriptType String where
  attr ContentScriptType value = unsafeAttribute { key: "contentScriptType", value: prop' value }