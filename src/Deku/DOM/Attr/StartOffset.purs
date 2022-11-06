module Deku.DOM.Attr.StartOffset where

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data StartOffset = StartOffset

instance Attr TextPath_ StartOffset String where
  attr StartOffset value = unsafeAttribute
    { key: "startOffset", value: prop' value }