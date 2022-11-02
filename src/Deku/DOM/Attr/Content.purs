module Deku.DOM.Attr.Content where

import Deku.DOM.Elt.Meta (Meta_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Content = Content

instance Attr Meta_ Content String where
  attr Content value = unsafeAttribute { key: "content", value: prop' value }
