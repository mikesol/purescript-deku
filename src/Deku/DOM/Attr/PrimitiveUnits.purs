module Deku.DOM.Attr.PrimitiveUnits where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PrimitiveUnits = PrimitiveUnits

instance Attr Filter_ PrimitiveUnits String where
  attr PrimitiveUnits bothValues = unsafeAttribute $ Both
    { key: "primitiveUnits", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "primitiveUnits", value: prop' value })
  pureAttr PrimitiveUnits value = unsafeAttribute $ This
    { key: "primitiveUnits", value: prop' value }
  unpureAttr PrimitiveUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "primitiveUnits", value: prop' value }

instance Attr everything PrimitiveUnits Unit where
  attr PrimitiveUnits bothValues = unsafeAttribute $ Both
    { key: "primitiveUnits", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "primitiveUnits", value: unset' })
  pureAttr PrimitiveUnits _ = unsafeAttribute $ This
    { key: "primitiveUnits", value: unset' }
  unpureAttr PrimitiveUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "primitiveUnits", value: unset' }
