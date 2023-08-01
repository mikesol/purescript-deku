module Deku.DOM.Attr.LengthAdjust where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data LengthAdjust = LengthAdjust

instance Attr Text_ LengthAdjust String where
  attr LengthAdjust bothValues = unsafeAttribute $ Both
    { key: "lengthAdjust", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lengthAdjust", value: prop' value })
  pureAttr LengthAdjust value = unsafeAttribute $ This
    { key: "lengthAdjust", value: prop' value }
  unpureAttr LengthAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lengthAdjust", value: prop' value }

instance Attr TextPath_ LengthAdjust String where
  attr LengthAdjust bothValues = unsafeAttribute $ Both
    { key: "lengthAdjust", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lengthAdjust", value: prop' value })
  pureAttr LengthAdjust value = unsafeAttribute $ This
    { key: "lengthAdjust", value: prop' value }
  unpureAttr LengthAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lengthAdjust", value: prop' value }

instance Attr Tspan_ LengthAdjust String where
  attr LengthAdjust bothValues = unsafeAttribute $ Both
    { key: "lengthAdjust", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "lengthAdjust", value: prop' value })
  pureAttr LengthAdjust value = unsafeAttribute $ This
    { key: "lengthAdjust", value: prop' value }
  unpureAttr LengthAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "lengthAdjust", value: prop' value }

instance Attr everything LengthAdjust Unit where
  attr LengthAdjust bothValues = unsafeAttribute $ Both
    { key: "lengthAdjust", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "lengthAdjust", value: unset' })
  pureAttr LengthAdjust _ = unsafeAttribute $ This
    { key: "lengthAdjust", value: unset' }
  unpureAttr LengthAdjust eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "lengthAdjust", value: unset' }
