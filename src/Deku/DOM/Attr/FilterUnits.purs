module Deku.DOM.Attr.FilterUnits where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data FilterUnits = FilterUnits

instance Attr Filter_ FilterUnits String where
  attr FilterUnits bothValues = unsafeAttribute $ Both
    { key: "filterUnits", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "filterUnits", value: prop' value })
  pureAttr FilterUnits value = unsafeAttribute $ This
    { key: "filterUnits", value: prop' value }
  unpureAttr FilterUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "filterUnits", value: prop' value }

instance Attr everything FilterUnits Unit where
  attr FilterUnits bothValues = unsafeAttribute $ Both
    { key: "filterUnits", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "filterUnits", value: unset' })
  pureAttr FilterUnits _ = unsafeAttribute $ This
    { key: "filterUnits", value: unset' }
  unpureAttr FilterUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "filterUnits", value: unset' }
