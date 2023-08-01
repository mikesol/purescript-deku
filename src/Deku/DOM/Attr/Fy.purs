module Deku.DOM.Attr.Fy where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fy = Fy

instance Attr RadialGradient_ Fy String where
  attr Fy bothValues = unsafeAttribute $ Both
    { key: "fy", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "fy", value: prop' value })
  pureAttr Fy value = unsafeAttribute $ This { key: "fy", value: prop' value }
  unpureAttr Fy eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "fy", value: prop' value }

instance Attr everything Fy Unit where
  attr Fy bothValues = unsafeAttribute $ Both { key: "fy", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "fy", value: unset' })
  pureAttr Fy _ = unsafeAttribute $ This { key: "fy", value: unset' }
  unpureAttr Fy eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "fy", value: unset' }
