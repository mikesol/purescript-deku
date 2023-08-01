module Deku.DOM.Attr.Formenctype where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formenctype = Formenctype

instance Attr Button_ Formenctype String where
  attr Formenctype bothValues = unsafeAttribute $ Both
    { key: "formenctype", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formenctype", value: prop' value })
  pureAttr Formenctype value = unsafeAttribute $ This
    { key: "formenctype", value: prop' value }
  unpureAttr Formenctype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formenctype", value: prop' value }

instance Attr Input_ Formenctype String where
  attr Formenctype bothValues = unsafeAttribute $ Both
    { key: "formenctype", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "formenctype", value: prop' value })
  pureAttr Formenctype value = unsafeAttribute $ This
    { key: "formenctype", value: prop' value }
  unpureAttr Formenctype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formenctype", value: prop' value }

instance Attr everything Formenctype Unit where
  attr Formenctype bothValues = unsafeAttribute $ Both
    { key: "formenctype", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "formenctype", value: unset' })
  pureAttr Formenctype _ = unsafeAttribute $ This
    { key: "formenctype", value: unset' }
  unpureAttr Formenctype eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formenctype", value: unset' }
