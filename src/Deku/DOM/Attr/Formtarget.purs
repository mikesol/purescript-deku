module Deku.DOM.Attr.Formtarget where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Button (Button_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Formtarget = Formtarget

instance Attr Button_ Formtarget String where
  attr Formtarget bothValues = unsafeAttribute $ Both
    { key: "formtarget", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "formtarget", value: prop' value })
  pureAttr Formtarget value = unsafeAttribute $ This
    { key: "formtarget", value: prop' value }
  unpureAttr Formtarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formtarget", value: prop' value }

instance Attr Input_ Formtarget String where
  attr Formtarget bothValues = unsafeAttribute $ Both
    { key: "formtarget", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "formtarget", value: prop' value })
  pureAttr Formtarget value = unsafeAttribute $ This
    { key: "formtarget", value: prop' value }
  unpureAttr Formtarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "formtarget", value: prop' value }

instance Attr everything Formtarget Unit where
  attr Formtarget bothValues = unsafeAttribute $ Both
    { key: "formtarget", value: unset' }
    (snd bothValues <#> \_ -> { key: "formtarget", value: unset' })
  pureAttr Formtarget _ = unsafeAttribute $ This
    { key: "formtarget", value: unset' }
  unpureAttr Formtarget eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "formtarget", value: unset' }
