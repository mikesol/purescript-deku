module Deku.DOM.Attr.AttributeType where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AttributeType = AttributeType

instance Attr AnimateTransform_ AttributeType String where
  attr AttributeType bothValues = unsafeAttribute $ Both
    { key: "attributeType", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "attributeType", value: prop' value })
  pureAttr AttributeType value = unsafeAttribute $ This
    { key: "attributeType", value: prop' value }
  unpureAttr AttributeType eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "attributeType", value: prop' value }

instance Attr everything AttributeType Unit where
  attr AttributeType bothValues = unsafeAttribute $ Both
    { key: "attributeType", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "attributeType", value: unset' })
  pureAttr AttributeType _ = unsafeAttribute $ This
    { key: "attributeType", value: unset' }
  unpureAttr AttributeType eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "attributeType", value: unset' }
