module Deku.DOM.Attr.MaskContentUnits where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Mask (Mask_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MaskContentUnits = MaskContentUnits

instance Attr Mask_ MaskContentUnits String where
  attr MaskContentUnits bothValues = unsafeAttribute $ Both
    { key: "maskContentUnits", value: prop' (fst bothValues) }
    ( snd bothValues <#> \value ->
        { key: "maskContentUnits", value: prop' value }
    )
  pureAttr MaskContentUnits value = unsafeAttribute $ This
    { key: "maskContentUnits", value: prop' value }
  unpureAttr MaskContentUnits eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "maskContentUnits", value: prop' value }

instance Attr everything MaskContentUnits Unit where
  attr MaskContentUnits bothValues = unsafeAttribute $ Both
    { key: "maskContentUnits", value: unset' }
    (snd bothValues <#> \_ -> { key: "maskContentUnits", value: unset' })
  pureAttr MaskContentUnits _ = unsafeAttribute $ This
    { key: "maskContentUnits", value: unset' }
  unpureAttr MaskContentUnits eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "maskContentUnits", value: unset' }
