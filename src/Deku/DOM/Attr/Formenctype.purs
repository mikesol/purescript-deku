module Deku.DOM.Attr.Formenctype where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formenctype = Formenctype

instance Attr Button_ Formenctype String where
  attr Formenctype bothValues = unsafeAttribute $ Both
    { key: "formenctype", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "formenctype", value: prop' value })
  pureAttr Formenctype value = unsafeAttribute $ This
    { key: "formenctype", value: prop' value }
  unpureAttr Formenctype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formenctype", value: prop' value }

instance Attr Input_ Formenctype String where
  attr Formenctype bothValues = unsafeAttribute $ Both
    { key: "formenctype", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "formenctype", value: prop' value })
  pureAttr Formenctype value = unsafeAttribute $ This
    { key: "formenctype", value: prop' value }
  unpureAttr Formenctype eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formenctype", value: prop' value }

instance Attr everything Formenctype Unit where
  attr Formenctype bothValues = unsafeAttribute $ Both
    { key: "formenctype", value: unset' }
    (snd bothValues <#> \_ -> { key: "formenctype", value: unset' })
  pureAttr Formenctype _ = unsafeAttribute $ This
    { key: "formenctype", value: unset' }
  unpureAttr Formenctype eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formenctype", value: unset' }
