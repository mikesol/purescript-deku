module Deku.DOM.Attr.PatternContentUnits where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PatternContentUnits = PatternContentUnits

instance Attr Pattern_ PatternContentUnits String where
  attr PatternContentUnits bothValues = unsafeAttribute $ Both
    { key: "patternContentUnits", value: prop' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "patternContentUnits", value: prop' value }
    )
  pureAttr PatternContentUnits value = unsafeAttribute $ This
    { key: "patternContentUnits", value: prop' value }
  unpureAttr PatternContentUnits eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "patternContentUnits", value: prop' value }

instance Attr everything PatternContentUnits Unit where
  attr PatternContentUnits bothValues = unsafeAttribute $ Both
    { key: "patternContentUnits", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "patternContentUnits", value: unset' })
  pureAttr PatternContentUnits _ = unsafeAttribute $ This
    { key: "patternContentUnits", value: unset' }
  unpureAttr PatternContentUnits eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "patternContentUnits", value: unset' }
