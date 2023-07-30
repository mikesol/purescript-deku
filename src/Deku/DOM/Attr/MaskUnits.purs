module Deku.DOM.Attr.MaskUnits where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Mask (Mask_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MaskUnits = MaskUnits

instance Attr Mask_ MaskUnits String where
  attr MaskUnits bothValues = unsafeAttribute $ Both
    { key: "maskUnits", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "maskUnits", value: prop' value })
  pureAttr MaskUnits value = unsafeAttribute $ This
    { key: "maskUnits", value: prop' value }
  unpureAttr MaskUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "maskUnits", value: prop' value }

instance Attr everything MaskUnits Unit where
  attr MaskUnits bothValues = unsafeAttribute $ Both
    { key: "maskUnits", value: unset' }
    (snd bothValues <#> \_ -> { key: "maskUnits", value: unset' })
  pureAttr MaskUnits _ = unsafeAttribute $ This
    { key: "maskUnits", value: unset' }
  unpureAttr MaskUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "maskUnits", value: unset' }
