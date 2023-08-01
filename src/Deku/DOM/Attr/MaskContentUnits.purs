module Deku.DOM.Attr.MaskContentUnits where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Mask (Mask_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MaskContentUnits = MaskContentUnits

instance Attr Mask_ MaskContentUnits String where
  attr MaskContentUnits bothValues = unsafeAttribute $ Both
    { key: "maskContentUnits", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "maskContentUnits", value: prop' value }
    )
  pureAttr MaskContentUnits value = unsafeAttribute $ This
    { key: "maskContentUnits", value: prop' value }
  unpureAttr MaskContentUnits eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "maskContentUnits", value: prop' value }

instance Attr everything MaskContentUnits Unit where
  attr MaskContentUnits bothValues = unsafeAttribute $ Both
    { key: "maskContentUnits", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "maskContentUnits", value: unset' })
  pureAttr MaskContentUnits _ = unsafeAttribute $ This
    { key: "maskContentUnits", value: unset' }
  unpureAttr MaskContentUnits eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "maskContentUnits", value: unset' }
