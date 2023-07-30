module Deku.DOM.Attr.StartOffset where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data StartOffset = StartOffset

instance Attr TextPath_ StartOffset String where
  attr StartOffset bothValues = unsafeAttribute $ Both
    { key: "startOffset", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "startOffset", value: prop' value })
  pureAttr StartOffset value = unsafeAttribute $ This
    { key: "startOffset", value: prop' value }
  unpureAttr StartOffset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "startOffset", value: prop' value }

instance Attr everything StartOffset Unit where
  attr StartOffset bothValues = unsafeAttribute $ Both
    { key: "startOffset", value: unset' }
    (snd bothValues <#> \_ -> { key: "startOffset", value: unset' })
  pureAttr StartOffset _ = unsafeAttribute $ This
    { key: "startOffset", value: unset' }
  unpureAttr StartOffset eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "startOffset", value: unset' }
