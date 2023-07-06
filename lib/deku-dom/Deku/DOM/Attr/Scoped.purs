module Deku.DOM.Attr.Scoped where

import Prelude

import Deku.DOM.Elt.Style (Style_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Scoped = Scoped

instance Attr Style_ Scoped String where
  attr Scoped value = unsafeAttribute { key: "scoped", value: prop' value }

instance Attr everything Scoped Unit where
  attr Scoped _ = unsafeAttribute
    { key: "scoped", value: unset' }
