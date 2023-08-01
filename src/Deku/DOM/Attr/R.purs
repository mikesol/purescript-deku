module Deku.DOM.Attr.R where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data R = R

instance Attr Circle_ R String where
  attr R bothValues = unsafeAttribute $ Both
    { key: "r", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "r", value: prop' value })
  pureAttr R value = unsafeAttribute $ This { key: "r", value: prop' value }
  unpureAttr R eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "r", value: prop' value }

instance Attr RadialGradient_ R String where
  attr R bothValues = unsafeAttribute $ Both
    { key: "r", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "r", value: prop' value })
  pureAttr R value = unsafeAttribute $ This { key: "r", value: prop' value }
  unpureAttr R eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "r", value: prop' value }

instance Attr everything R Unit where
  attr R bothValues = unsafeAttribute $ Both { key: "r", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "r", value: unset' })
  pureAttr R _ = unsafeAttribute $ This { key: "r", value: unset' }
  unpureAttr R eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "r", value: unset' }
