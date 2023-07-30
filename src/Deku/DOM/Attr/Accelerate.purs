module Deku.DOM.Attr.Accelerate where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Accelerate = Accelerate

instance Attr AnimateTransform_ Accelerate String where
  attr Accelerate bothValues = unsafeAttribute $ Both
    { key: "accelerate", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "accelerate", value: prop' value })
  pureAttr Accelerate value = unsafeAttribute $ This
    { key: "accelerate", value: prop' value }
  unpureAttr Accelerate eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accelerate", value: prop' value }

instance Attr everything Accelerate Unit where
  attr Accelerate bothValues = unsafeAttribute $ Both
    { key: "accelerate", value: unset' }
    (snd bothValues <#> \_ -> { key: "accelerate", value: unset' })
  pureAttr Accelerate _ = unsafeAttribute $ This
    { key: "accelerate", value: unset' }
  unpureAttr Accelerate eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "accelerate", value: unset' }
