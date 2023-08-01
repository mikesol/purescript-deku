module Deku.DOM.Attr.Formnovalidate where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formnovalidate = Formnovalidate

instance Attr Button_ Formnovalidate String where
  attr Formnovalidate bothValues = unsafeAttribute $ Both
    { key: "formnovalidate", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formnovalidate", value: prop' value })
  pureAttr Formnovalidate value = unsafeAttribute $ This
    { key: "formnovalidate", value: prop' value }
  unpureAttr Formnovalidate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formnovalidate", value: prop' value }

instance Attr Input_ Formnovalidate String where
  attr Formnovalidate bothValues = unsafeAttribute $ Both
    { key: "formnovalidate", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formnovalidate", value: prop' value })
  pureAttr Formnovalidate value = unsafeAttribute $ This
    { key: "formnovalidate", value: prop' value }
  unpureAttr Formnovalidate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formnovalidate", value: prop' value }

instance Attr everything Formnovalidate Unit where
  attr Formnovalidate bothValues = unsafeAttribute $ Both
    { key: "formnovalidate", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "formnovalidate", value: unset' })
  pureAttr Formnovalidate _ = unsafeAttribute $ This
    { key: "formnovalidate", value: unset' }
  unpureAttr Formnovalidate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formnovalidate", value: unset' }
