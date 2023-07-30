module Deku.DOM.Attr.Enterkeyhint where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Enterkeyhint = Enterkeyhint

instance Attr Textarea_ Enterkeyhint String where
  attr Enterkeyhint bothValues = unsafeAttribute $ Both
    { key: "enterkeyhint", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "enterkeyhint", value: prop' value })
  pureAttr Enterkeyhint value = unsafeAttribute $ This
    { key: "enterkeyhint", value: prop' value }
  unpureAttr Enterkeyhint eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "enterkeyhint", value: prop' value }

instance Attr everything Enterkeyhint Unit where
  attr Enterkeyhint bothValues = unsafeAttribute $ Both
    { key: "enterkeyhint", value: unset' }
    (snd bothValues <#> \_ -> { key: "enterkeyhint", value: unset' })
  pureAttr Enterkeyhint _ = unsafeAttribute $ This
    { key: "enterkeyhint", value: unset' }
  unpureAttr Enterkeyhint eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "enterkeyhint", value: unset' }
