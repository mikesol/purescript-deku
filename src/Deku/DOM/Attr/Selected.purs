module Deku.DOM.Attr.Selected where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Option (Option_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Selected = Selected

instance Attr Option_ Selected String where
  attr Selected bothValues = unsafeAttribute $ Both
    { key: "selected", value: prop' (fst bothValues) }
    (snd bothValues <#> \value -> { key: "selected", value: prop' value })
  pureAttr Selected value = unsafeAttribute $ This
    { key: "selected", value: prop' value }
  unpureAttr Selected eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "selected", value: prop' value }

instance Attr everything Selected Unit where
  attr Selected bothValues = unsafeAttribute $ Both
    { key: "selected", value: unset' }
    (snd bothValues <#> \_ -> { key: "selected", value: unset' })
  pureAttr Selected _ = unsafeAttribute $ This
    { key: "selected", value: unset' }
  unpureAttr Selected eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "selected", value: unset' }
