module Deku.DOM.Attr.Side where

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Side = Side

instance Attr TextPath_ Side String where
  attr Side value = unsafeAttribute { key: "side", value: prop' value }