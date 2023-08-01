module Deku.DOM.Attr.TextLength where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TextLength = TextLength

instance Attr Text_ TextLength String where
  attr TextLength bothValues = unsafeAttribute $ Both
    { key: "textLength", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "textLength", value: prop' value })
  pureAttr TextLength value = unsafeAttribute $ This
    { key: "textLength", value: prop' value }
  unpureAttr TextLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "textLength", value: prop' value }

instance Attr TextPath_ TextLength String where
  attr TextLength bothValues = unsafeAttribute $ Both
    { key: "textLength", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "textLength", value: prop' value })
  pureAttr TextLength value = unsafeAttribute $ This
    { key: "textLength", value: prop' value }
  unpureAttr TextLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "textLength", value: prop' value }

instance Attr Tspan_ TextLength String where
  attr TextLength bothValues = unsafeAttribute $ Both
    { key: "textLength", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "textLength", value: prop' value })
  pureAttr TextLength value = unsafeAttribute $ This
    { key: "textLength", value: prop' value }
  unpureAttr TextLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "textLength", value: prop' value }

instance Attr everything TextLength Unit where
  attr TextLength bothValues = unsafeAttribute $ Both
    { key: "textLength", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "textLength", value: unset' })
  pureAttr TextLength _ = unsafeAttribute $ This
    { key: "textLength", value: unset' }
  unpureAttr TextLength eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "textLength", value: unset' }
