module Deku.DOM.Attr.Headers where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Headers = Headers

instance Attr Td_ Headers String where
  attr Headers bothValues = unsafeAttribute $ Both
    { key: "headers", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "headers", value: prop' value })
  pureAttr Headers value = unsafeAttribute $ This
    { key: "headers", value: prop' value }
  unpureAttr Headers eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "headers", value: prop' value }

instance Attr Th_ Headers String where
  attr Headers bothValues = unsafeAttribute $ Both
    { key: "headers", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "headers", value: prop' value })
  pureAttr Headers value = unsafeAttribute $ This
    { key: "headers", value: prop' value }
  unpureAttr Headers eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "headers", value: prop' value }

instance Attr everything Headers Unit where
  attr Headers bothValues = unsafeAttribute $ Both
    { key: "headers", value: unset' }
    (snd bothValues <#> \_ -> { key: "headers", value: unset' })
  pureAttr Headers _ = unsafeAttribute $ This { key: "headers", value: unset' }
  unpureAttr Headers eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "headers", value: unset' }
