module Deku.DOM.Attr.Operator where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Operator = Operator

instance Attr FeComposite_ Operator String where
  attr Operator bothValues = unsafeAttribute $ Both
    { key: "operator", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "operator", value: prop' value })
  pureAttr Operator value = unsafeAttribute $ This
    { key: "operator", value: prop' value }
  unpureAttr Operator eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "operator", value: prop' value }

instance Attr FeMorphology_ Operator String where
  attr Operator bothValues = unsafeAttribute $ Both
    { key: "operator", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "operator", value: prop' value })
  pureAttr Operator value = unsafeAttribute $ This
    { key: "operator", value: prop' value }
  unpureAttr Operator eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "operator", value: prop' value }

instance Attr everything Operator Unit where
  attr Operator bothValues = unsafeAttribute $ Both
    { key: "operator", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "operator", value: unset' })
  pureAttr Operator _ = unsafeAttribute $ This
    { key: "operator", value: unset' }
  unpureAttr Operator eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "operator", value: unset' }
