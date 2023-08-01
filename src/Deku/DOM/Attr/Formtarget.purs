module Deku.DOM.Attr.Formtarget where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formtarget = Formtarget

instance Attr Button_ Formtarget String where
  attr Formtarget bothValues = unsafeAttribute $ Both
    { key: "formtarget", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formtarget", value: prop' value })
  pureAttr Formtarget value = unsafeAttribute $ This
    { key: "formtarget", value: prop' value }
  unpureAttr Formtarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formtarget", value: prop' value }

instance Attr Input_ Formtarget String where
  attr Formtarget bothValues = unsafeAttribute $ Both
    { key: "formtarget", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formtarget", value: prop' value })
  pureAttr Formtarget value = unsafeAttribute $ This
    { key: "formtarget", value: prop' value }
  unpureAttr Formtarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formtarget", value: prop' value }

instance Attr everything Formtarget Unit where
  attr Formtarget bothValues = unsafeAttribute $ Both
    { key: "formtarget", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "formtarget", value: unset' })
  pureAttr Formtarget _ = unsafeAttribute $ This
    { key: "formtarget", value: unset' }
  unpureAttr Formtarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formtarget", value: unset' }
