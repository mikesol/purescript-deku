module Deku.DOM.Attr.ClipPathUnits where

import Deku.DOM.Elt.ClipPath (ClipPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data ClipPathUnits = ClipPathUnits

instance Attr ClipPath_ ClipPathUnits String where
  attr ClipPathUnits value = unsafeAttribute { key: "clipPathUnits", value: prop' value }