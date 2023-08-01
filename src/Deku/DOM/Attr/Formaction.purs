module Deku.DOM.Attr.Formaction where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Button (Button_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formaction = Formaction

instance Attr Input_ Formaction String where
  attr Formaction bothValues = unsafeAttribute $ Both
    { key: "formaction", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formaction", value: prop' value })
  pureAttr Formaction value = unsafeAttribute $ This
    { key: "formaction", value: prop' value }
  unpureAttr Formaction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formaction", value: prop' value }

instance Attr Button_ Formaction String where
  attr Formaction bothValues = unsafeAttribute $ Both
    { key: "formaction", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formaction", value: prop' value })
  pureAttr Formaction value = unsafeAttribute $ This
    { key: "formaction", value: prop' value }
  unpureAttr Formaction eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formaction", value: prop' value }

instance Attr everything Formaction Unit where
  attr Formaction bothValues = unsafeAttribute $ Both
    { key: "formaction", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "formaction", value: unset' })
  pureAttr Formaction _ = unsafeAttribute $ This
    { key: "formaction", value: unset' }
  unpureAttr Formaction eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formaction", value: unset' }
