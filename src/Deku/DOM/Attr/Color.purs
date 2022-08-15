module Deku.DOM.Attr.Color where

import Deku.DOM.Elt.Font (Font_)
import Deku.DOM.Elt.Hr (Hr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Color = Color

instance Attr Font_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Hr_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }
