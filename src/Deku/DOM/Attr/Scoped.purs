module Deku.DOM.Attr.Scoped where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Style (Style_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Scoped = Scoped

instance Attr Style_ Scoped String where
  attr Scoped bothValues = unsafeAttribute $ Both
    { key: "scoped", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "scoped", value: prop' value })
  pureAttr Scoped value = unsafeAttribute $ This
    { key: "scoped", value: prop' value }
  unpureAttr Scoped eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "scoped", value: prop' value }

instance Attr everything Scoped Unit where
  attr Scoped bothValues = unsafeAttribute $ Both
    { key: "scoped", value: unset' }
    (snd bothValues <#> \_ -> { key: "scoped", value: unset' })
  pureAttr Scoped _ = unsafeAttribute $ This { key: "scoped", value: unset' }
  unpureAttr Scoped eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "scoped", value: unset' }
