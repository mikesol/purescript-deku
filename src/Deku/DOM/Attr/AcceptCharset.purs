module Deku.DOM.Attr.AcceptCharset where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AcceptCharset = AcceptCharset

instance Attr Form_ AcceptCharset String where
  attr AcceptCharset bothValues = unsafeAttribute $ Both
    { key: "accept-charset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "accept-charset", value: prop' value })
  pureAttr AcceptCharset value = unsafeAttribute $ This
    { key: "accept-charset", value: prop' value }
  unpureAttr AcceptCharset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accept-charset", value: prop' value }

instance Attr everything AcceptCharset Unit where
  attr AcceptCharset bothValues = unsafeAttribute $ Both
    { key: "accept-charset", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "accept-charset", value: unset' })
  pureAttr AcceptCharset _ = unsafeAttribute $ This
    { key: "accept-charset", value: unset' }
  unpureAttr AcceptCharset eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "accept-charset", value: unset' }
