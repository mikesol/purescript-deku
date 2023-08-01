module Deku.DOM.Attr.High where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data High = High

instance Attr Meter_ High String where
  attr High bothValues = unsafeAttribute $ Both
    { key: "high", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "high", value: prop' value })
  pureAttr High value = unsafeAttribute $ This
    { key: "high", value: prop' value }
  unpureAttr High eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "high", value: prop' value }

instance Attr everything High Unit where
  attr High bothValues = unsafeAttribute $ Both { key: "high", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "high", value: unset' })
  pureAttr High _ = unsafeAttribute $ This { key: "high", value: unset' }
  unpureAttr High eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "high", value: unset' }
