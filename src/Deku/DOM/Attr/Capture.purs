module Deku.DOM.Attr.Capture where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Capture = Capture

instance Attr Input_ Capture String where
  attr Capture bothValues = unsafeAttribute $ Both
    { key: "capture", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "capture", value: prop' value })
  pureAttr Capture value = unsafeAttribute $ This
    { key: "capture", value: prop' value }
  unpureAttr Capture eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "capture", value: prop' value }

instance Attr everything Capture Unit where
  attr Capture bothValues = unsafeAttribute $ Both
    { key: "capture", value: unset' }
    (snd bothValues <#> \_ -> { key: "capture", value: unset' })
  pureAttr Capture _ = unsafeAttribute $ This { key: "capture", value: unset' }
  unpureAttr Capture eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "capture", value: unset' }
