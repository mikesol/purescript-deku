module Deku.DOM.Attr.AttributeName where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AttributeName = AttributeName

instance Attr Animate_ AttributeName String where
  attr AttributeName bothValues = unsafeAttribute $ Both
    { key: "attributeName", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "attributeName", value: prop' value })
  pureAttr AttributeName value = unsafeAttribute $ This
    { key: "attributeName", value: prop' value }
  unpureAttr AttributeName eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "attributeName", value: prop' value }

instance Attr AnimateMotion_ AttributeName String where
  attr AttributeName bothValues = unsafeAttribute $ Both
    { key: "attributeName", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "attributeName", value: prop' value })
  pureAttr AttributeName value = unsafeAttribute $ This
    { key: "attributeName", value: prop' value }
  unpureAttr AttributeName eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "attributeName", value: prop' value }

instance Attr AnimateTransform_ AttributeName String where
  attr AttributeName bothValues = unsafeAttribute $ Both
    { key: "attributeName", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "attributeName", value: prop' value })
  pureAttr AttributeName value = unsafeAttribute $ This
    { key: "attributeName", value: prop' value }
  unpureAttr AttributeName eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "attributeName", value: prop' value }

instance Attr Set_ AttributeName String where
  attr AttributeName bothValues = unsafeAttribute $ Both
    { key: "attributeName", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "attributeName", value: prop' value })
  pureAttr AttributeName value = unsafeAttribute $ This
    { key: "attributeName", value: prop' value }
  unpureAttr AttributeName eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "attributeName", value: prop' value }

instance Attr everything AttributeName Unit where
  attr AttributeName bothValues = unsafeAttribute $ Both
    { key: "attributeName", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "attributeName", value: unset' })
  pureAttr AttributeName _ = unsafeAttribute $ This
    { key: "attributeName", value: unset' }
  unpureAttr AttributeName eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "attributeName", value: unset' }
