module Deku.DOM.Attr.Scope where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Scope = Scope

instance Attr Th_ Scope String where
  attr Scope bothValues = unsafeAttribute $ Both
    { key: "scope", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "scope", value: prop' value })
  pureAttr Scope value = unsafeAttribute $ This
    { key: "scope", value: prop' value }
  unpureAttr Scope eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "scope", value: prop' value }

instance Attr everything Scope Unit where
  attr Scope bothValues = unsafeAttribute $ Both { key: "scope", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "scope", value: unset' })
  pureAttr Scope _ = unsafeAttribute $ This { key: "scope", value: unset' }
  unpureAttr Scope eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "scope", value: unset' }
