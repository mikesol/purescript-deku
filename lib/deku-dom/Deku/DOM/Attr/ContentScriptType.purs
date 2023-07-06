module Deku.DOM.Attr.ContentScriptType where

import Prelude

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ContentScriptType = ContentScriptType

instance Attr Svg_ ContentScriptType String where
  attr ContentScriptType value = unsafeAttribute
    { key: "contentScriptType", value: prop' value }

instance Attr everything ContentScriptType Unit where
  attr ContentScriptType _ = unsafeAttribute
    { key: "contentScriptType", value: unset' }
