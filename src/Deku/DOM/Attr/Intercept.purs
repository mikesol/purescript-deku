module Deku.DOM.Attr.Intercept where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Intercept = Intercept

instance Attr FeFuncA_ Intercept String where
  attr Intercept bothValues = unsafeAttribute $ Both
    { key: "intercept", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "intercept", value: prop' value })
  pureAttr Intercept value = unsafeAttribute $ This
    { key: "intercept", value: prop' value }
  unpureAttr Intercept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr FeFuncB_ Intercept String where
  attr Intercept bothValues = unsafeAttribute $ Both
    { key: "intercept", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "intercept", value: prop' value })
  pureAttr Intercept value = unsafeAttribute $ This
    { key: "intercept", value: prop' value }
  unpureAttr Intercept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr FeFuncG_ Intercept String where
  attr Intercept bothValues = unsafeAttribute $ Both
    { key: "intercept", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "intercept", value: prop' value })
  pureAttr Intercept value = unsafeAttribute $ This
    { key: "intercept", value: prop' value }
  unpureAttr Intercept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr FeFuncR_ Intercept String where
  attr Intercept bothValues = unsafeAttribute $ Both
    { key: "intercept", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "intercept", value: prop' value })
  pureAttr Intercept value = unsafeAttribute $ This
    { key: "intercept", value: prop' value }
  unpureAttr Intercept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr everything Intercept Unit where
  attr Intercept bothValues = unsafeAttribute $ Both
    { key: "intercept", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "intercept", value: unset' })
  pureAttr Intercept _ = unsafeAttribute $ This
    { key: "intercept", value: unset' }
  unpureAttr Intercept eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "intercept", value: unset' }
