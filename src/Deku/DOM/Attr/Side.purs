module Deku.DOM.Attr.Side where

import Prelude

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Side = Side

instance Attr TextPath_ Side String where
  attr Side value = unsafeAttribute { key: "side", value: prop' value }

instance Attr everything Side Unit where
  attr Side _ = unsafeAttribute
    { key: "side", value: unset' }
