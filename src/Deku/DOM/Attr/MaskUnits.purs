module Deku.DOM.Attr.MaskUnits where

import Prelude

import Deku.DOM.Elt.Mask (Mask_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MaskUnits = MaskUnits

instance Attr Mask_ MaskUnits String where
  attr MaskUnits value = unsafeAttribute
    { key: "maskUnits", value: prop' value }

instance Attr everything MaskUnits Unit where
  attr MaskUnits _ = unsafeAttribute
    { key: "maskUnits", value: unset' }
