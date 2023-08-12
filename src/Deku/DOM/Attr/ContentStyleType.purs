module Deku.DOM.Attr.ContentStyleType where

import Prelude

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ContentStyleType = ContentStyleType

instance Attr Svg_ ContentStyleType String where
  attr ContentStyleType value = unsafeAttribute
    { key: "contentStyleType", value: prop' value }

instance Attr everything ContentStyleType Unit where
  attr ContentStyleType _ = unsafeAttribute
    { key: "contentStyleType", value: unset' }
