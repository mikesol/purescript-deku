module Deku.DOM.Attr.Selected where

import Prelude

import Deku.DOM.Elt.Option (Option_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Selected = Selected

instance Attr Option_ Selected String where
  attr Selected value = unsafeAttribute { key: "selected", value: prop' value }

instance Attr everything Selected Unit where
  attr Selected _ = unsafeAttribute
    { key: "selected", value: unset' }
