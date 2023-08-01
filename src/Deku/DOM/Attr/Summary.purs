module Deku.DOM.Attr.Summary where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Table (Table_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Summary = Summary

instance Attr Table_ Summary String where
  attr Summary bothValues = unsafeAttribute $ Both
    { key: "summary", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "summary", value: prop' value })
  pureAttr Summary value = unsafeAttribute $ This
    { key: "summary", value: prop' value }
  unpureAttr Summary eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "summary", value: prop' value }

instance Attr everything Summary Unit where
  attr Summary bothValues = unsafeAttribute $ Both
    { key: "summary", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "summary", value: unset' })
  pureAttr Summary _ = unsafeAttribute $ This { key: "summary", value: unset' }
  unpureAttr Summary eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "summary", value: unset' }
