module Deku.DOM.Attr.Spacing where

import Prelude

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Spacing = Spacing

instance Attr TextPath_ Spacing String where
  attr Spacing value = unsafeAttribute { key: "spacing", value: prop' value }

instance Attr everything Spacing Unit where
  attr Spacing _ = unsafeAttribute
    { key: "spacing", value: unset' }
