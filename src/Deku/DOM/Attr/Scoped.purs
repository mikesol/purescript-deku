module Deku.DOM.Attr.Scoped where

import Deku.DOM.Elt.Style (Style_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Scoped = Scoped

instance Attr Style_ Scoped String where
  attr Scoped value = unsafeAttribute { key: "scoped", value: prop' value }
