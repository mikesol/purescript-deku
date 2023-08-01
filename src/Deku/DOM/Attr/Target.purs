module Deku.DOM.Attr.Target where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Base (Base_)
import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Target = Target

instance Attr A_ Target String where
  attr Target bothValues = unsafeAttribute $ Both
    { key: "target", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "target", value: prop' value })
  pureAttr Target value = unsafeAttribute $ This
    { key: "target", value: prop' value }
  unpureAttr Target eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "target", value: prop' value }

instance Attr Area_ Target String where
  attr Target bothValues = unsafeAttribute $ Both
    { key: "target", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "target", value: prop' value })
  pureAttr Target value = unsafeAttribute $ This
    { key: "target", value: prop' value }
  unpureAttr Target eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "target", value: prop' value }

instance Attr Base_ Target String where
  attr Target bothValues = unsafeAttribute $ Both
    { key: "target", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "target", value: prop' value })
  pureAttr Target value = unsafeAttribute $ This
    { key: "target", value: prop' value }
  unpureAttr Target eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "target", value: prop' value }

instance Attr Form_ Target String where
  attr Target bothValues = unsafeAttribute $ Both
    { key: "target", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "target", value: prop' value })
  pureAttr Target value = unsafeAttribute $ This
    { key: "target", value: prop' value }
  unpureAttr Target eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "target", value: prop' value }

instance Attr everything Target Unit where
  attr Target bothValues = unsafeAttribute $ Both
    { key: "target", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "target", value: unset' })
  pureAttr Target _ = unsafeAttribute $ This { key: "target", value: unset' }
  unpureAttr Target eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "target", value: unset' }
