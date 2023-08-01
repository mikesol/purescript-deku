module Deku.DOM.Attr.PatternTransform where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PatternTransform = PatternTransform

instance Attr Pattern_ PatternTransform String where
  attr PatternTransform bothValues = unsafeAttribute $ Both
    { key: "patternTransform", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "patternTransform", value: prop' value }
    )
  pureAttr PatternTransform value = unsafeAttribute $ This
    { key: "patternTransform", value: prop' value }
  unpureAttr PatternTransform eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "patternTransform", value: prop' value }

instance Attr everything PatternTransform Unit where
  attr PatternTransform bothValues = unsafeAttribute $ Both
    { key: "patternTransform", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "patternTransform", value: unset' })
  pureAttr PatternTransform _ = unsafeAttribute $ This
    { key: "patternTransform", value: unset' }
  unpureAttr PatternTransform eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "patternTransform", value: unset' }
