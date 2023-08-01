module Deku.DOM.Attr.Accumulate where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Accumulate = Accumulate

instance Attr Animate_ Accumulate String where
  attr Accumulate bothValues = unsafeAttribute $ Both
    { key: "accumulate", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "accumulate", value: prop' value })
  pureAttr Accumulate value = unsafeAttribute $ This
    { key: "accumulate", value: prop' value }
  unpureAttr Accumulate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accumulate", value: prop' value }

instance Attr AnimateMotion_ Accumulate String where
  attr Accumulate bothValues = unsafeAttribute $ Both
    { key: "accumulate", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "accumulate", value: prop' value })
  pureAttr Accumulate value = unsafeAttribute $ This
    { key: "accumulate", value: prop' value }
  unpureAttr Accumulate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accumulate", value: prop' value }

instance Attr AnimateTransform_ Accumulate String where
  attr Accumulate bothValues = unsafeAttribute $ Both
    { key: "accumulate", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "accumulate", value: prop' value })
  pureAttr Accumulate value = unsafeAttribute $ This
    { key: "accumulate", value: prop' value }
  unpureAttr Accumulate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accumulate", value: prop' value }

instance Attr everything Accumulate Unit where
  attr Accumulate bothValues = unsafeAttribute $ Both
    { key: "accumulate", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "accumulate", value: unset' })
  pureAttr Accumulate _ = unsafeAttribute $ This
    { key: "accumulate", value: unset' }
  unpureAttr Accumulate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "accumulate", value: unset' }
