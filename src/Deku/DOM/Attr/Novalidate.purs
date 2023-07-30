module Deku.DOM.Attr.Novalidate where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Novalidate = Novalidate

instance Attr Form_ Novalidate String where
  attr Novalidate bothValues = unsafeAttribute $ Both
    { key: "novalidate", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "novalidate", value: prop' value })
  pureAttr Novalidate value = unsafeAttribute $ This
    { key: "novalidate", value: prop' value }
  unpureAttr Novalidate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "novalidate", value: prop' value }

instance Attr everything Novalidate Unit where
  attr Novalidate bothValues = unsafeAttribute $ Both
    { key: "novalidate", value: unset' }
    (snd bothValues <#> \_ -> { key: "novalidate", value: unset' })
  pureAttr Novalidate _ = unsafeAttribute $ This
    { key: "novalidate", value: unset' }
  unpureAttr Novalidate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "novalidate", value: unset' }
