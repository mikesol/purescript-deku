module Deku.DOM.Attr.MaskUnits where

import Deku.DOM.Elt.Mask (Mask_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data MaskUnits = MaskUnits

instance Attr Mask_ MaskUnits String where
  attr MaskUnits value = unsafeAttribute { key: "maskUnits", value: prop' value }