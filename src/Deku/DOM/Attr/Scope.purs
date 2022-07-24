module Deku.DOM.Attr.Scope where

import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Scope = Scope

instance Attr Th_ Scope String where
  attr Scope value = unsafeAttribute { key: "scope", value: prop' value }
