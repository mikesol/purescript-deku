module Deku.DOM.Attr.Charset where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Meta (Meta_)
import Deku.DOM.Elt.Script (Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Charset = Charset

instance Attr Meta_ Charset String where
  attr Charset bothValues = unsafeAttribute $ Both
    { key: "charset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "charset", value: prop' value })
  pureAttr Charset value = unsafeAttribute $ This
    { key: "charset", value: prop' value }
  unpureAttr Charset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "charset", value: prop' value }

instance Attr Script_ Charset String where
  attr Charset bothValues = unsafeAttribute $ Both
    { key: "charset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "charset", value: prop' value })
  pureAttr Charset value = unsafeAttribute $ This
    { key: "charset", value: prop' value }
  unpureAttr Charset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "charset", value: prop' value }

instance Attr everything Charset Unit where
  attr Charset bothValues = unsafeAttribute $ Both
    { key: "charset", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "charset", value: unset' })
  pureAttr Charset _ = unsafeAttribute $ This { key: "charset", value: unset' }
  unpureAttr Charset eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "charset", value: unset' }
