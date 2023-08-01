module Deku.DOM.Attr.Maxlength where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Maxlength = Maxlength

instance Attr Input_ Maxlength String where
  attr Maxlength bothValues = unsafeAttribute $ Both
    { key: "maxlength", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "maxlength", value: prop' value })
  pureAttr Maxlength value = unsafeAttribute $ This
    { key: "maxlength", value: prop' value }
  unpureAttr Maxlength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "maxlength", value: prop' value }

instance Attr Textarea_ Maxlength String where
  attr Maxlength bothValues = unsafeAttribute $ Both
    { key: "maxlength", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "maxlength", value: prop' value })
  pureAttr Maxlength value = unsafeAttribute $ This
    { key: "maxlength", value: prop' value }
  unpureAttr Maxlength eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "maxlength", value: prop' value }

instance Attr everything Maxlength Unit where
  attr Maxlength bothValues = unsafeAttribute $ Both
    { key: "maxlength", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "maxlength", value: unset' })
  pureAttr Maxlength _ = unsafeAttribute $ This
    { key: "maxlength", value: unset' }
  unpureAttr Maxlength eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "maxlength", value: unset' }
