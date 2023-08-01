module Deku.DOM.Attr.Pattern where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Pattern = Pattern

instance Attr Input_ Pattern String where
  attr Pattern bothValues = unsafeAttribute $ Both
    { key: "pattern", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pattern", value: prop' value })
  pureAttr Pattern value = unsafeAttribute $ This
    { key: "pattern", value: prop' value }
  unpureAttr Pattern eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pattern", value: prop' value }

instance Attr everything Pattern Unit where
  attr Pattern bothValues = unsafeAttribute $ Both
    { key: "pattern", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pattern", value: unset' })
  pureAttr Pattern _ = unsafeAttribute $ This { key: "pattern", value: unset' }
  unpureAttr Pattern eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "pattern", value: unset' }
