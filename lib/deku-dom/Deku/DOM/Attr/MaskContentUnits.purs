module Deku.DOM.Attr.MaskContentUnits where

import Prelude

import Deku.DOM.Elt.Mask (Mask_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MaskContentUnits = MaskContentUnits

instance Attr Mask_ MaskContentUnits String where
  attr MaskContentUnits value = unsafeAttribute
    { key: "maskContentUnits", value: prop' value }

instance Attr everything MaskContentUnits Unit where
  attr MaskContentUnits _ = unsafeAttribute
    { key: "maskContentUnits", value: unset' }
