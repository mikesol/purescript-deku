module Deku.DOM.Attr.Spacing where

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Spacing = Spacing

instance Attr TextPath_ Spacing String where
  attr Spacing value = unsafeAttribute { key: "spacing", value: prop' value }