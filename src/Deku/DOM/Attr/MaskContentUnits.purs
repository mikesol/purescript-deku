module Deku.DOM.Attr.MaskContentUnits where

import Deku.DOM.Elt.Mask (Mask_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data MaskContentUnits = MaskContentUnits

instance Attr Mask_ MaskContentUnits String where
  attr MaskContentUnits value = unsafeAttribute { key: "maskContentUnits", value: prop' value }