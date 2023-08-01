module Deku.DOM.Attr.Selected where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Option (Option_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Selected = Selected

instance Attr Option_ Selected String where
  attr Selected bothValues = unsafeAttribute $ Both
    { key: "selected", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "selected", value: prop' value })
  pureAttr Selected value = unsafeAttribute $ This
    { key: "selected", value: prop' value }
  unpureAttr Selected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "selected", value: prop' value }

instance Attr everything Selected Unit where
  attr Selected bothValues = unsafeAttribute $ Both
    { key: "selected", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "selected", value: unset' })
  pureAttr Selected _ = unsafeAttribute $ This
    { key: "selected", value: unset' }
  unpureAttr Selected eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "selected", value: unset' }
