module Deku.DOM.Attr.BaseProfile where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data BaseProfile = BaseProfile

instance Attr Svg_ BaseProfile String where
  attr BaseProfile bothValues = unsafeAttribute $ Both
    { key: "baseProfile", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "baseProfile", value: prop' value })
  pureAttr BaseProfile value = unsafeAttribute $ This
    { key: "baseProfile", value: prop' value }
  unpureAttr BaseProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "baseProfile", value: prop' value }

instance Attr everything BaseProfile Unit where
  attr BaseProfile bothValues = unsafeAttribute $ Both
    { key: "baseProfile", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "baseProfile", value: unset' })
  pureAttr BaseProfile _ = unsafeAttribute $ This
    { key: "baseProfile", value: unset' }
  unpureAttr BaseProfile eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "baseProfile", value: unset' }
