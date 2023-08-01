module Deku.DOM.Attr.Required where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Required = Required

instance Attr Input_ Required String where
  attr Required bothValues = unsafeAttribute $ Both
    { key: "required", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "required", value: prop' value })
  pureAttr Required value = unsafeAttribute $ This
    { key: "required", value: prop' value }
  unpureAttr Required eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "required", value: prop' value }

instance Attr Select_ Required String where
  attr Required bothValues = unsafeAttribute $ Both
    { key: "required", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "required", value: prop' value })
  pureAttr Required value = unsafeAttribute $ This
    { key: "required", value: prop' value }
  unpureAttr Required eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "required", value: prop' value }

instance Attr Textarea_ Required String where
  attr Required bothValues = unsafeAttribute $ Both
    { key: "required", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "required", value: prop' value })
  pureAttr Required value = unsafeAttribute $ This
    { key: "required", value: prop' value }
  unpureAttr Required eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "required", value: prop' value }

instance Attr everything Required Unit where
  attr Required bothValues = unsafeAttribute $ Both
    { key: "required", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "required", value: unset' })
  pureAttr Required _ = unsafeAttribute $ This
    { key: "required", value: unset' }
  unpureAttr Required eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "required", value: unset' }
