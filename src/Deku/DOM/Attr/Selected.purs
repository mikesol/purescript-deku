module Deku.DOM.Attr.Selected where

import Deku.DOM.Elt.Option (Option_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Selected = Selected

instance Attr Option_ Selected String where
  attr Selected value = unsafeAttribute { key: "selected", value: prop' value }
