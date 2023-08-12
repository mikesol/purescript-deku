module Deku.DOM.Attr.Scope where

import Prelude

import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Scope = Scope

instance Attr Th_ Scope String where
  attr Scope value = unsafeAttribute { key: "scope", value: prop' value }

instance Attr everything Scope Unit where
  attr Scope _ = unsafeAttribute
    { key: "scope", value: unset' }
