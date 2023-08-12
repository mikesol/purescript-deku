module Deku.DOM.Attr.Pattern where

import Prelude

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Pattern = Pattern

instance Attr Input_ Pattern String where
  attr Pattern value = unsafeAttribute { key: "pattern", value: prop' value }

instance Attr everything Pattern Unit where
  attr Pattern _ = unsafeAttribute
    { key: "pattern", value: unset' }
