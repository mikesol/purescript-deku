module Deku.DOM.Attr.StartOffset where

import Prelude

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data StartOffset = StartOffset

instance Attr TextPath_ StartOffset String where
  attr StartOffset value = unsafeAttribute
    { key: "startOffset", value: prop' value }

instance Attr everything StartOffset Unit where
  attr StartOffset _ = unsafeAttribute
    { key: "startOffset", value: unset' }
