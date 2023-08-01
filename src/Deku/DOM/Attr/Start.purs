module Deku.DOM.Attr.Start where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Ol (Ol_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Start = Start

instance Attr Ol_ Start String where
  attr Start bothValues = unsafeAttribute $ Both
    { key: "start", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "start", value: prop' value })
  pureAttr Start value = unsafeAttribute $ This
    { key: "start", value: prop' value }
  unpureAttr Start eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "start", value: prop' value }

instance Attr everything Start Unit where
  attr Start bothValues = unsafeAttribute $ Both { key: "start", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "start", value: unset' })
  pureAttr Start _ = unsafeAttribute $ This { key: "start", value: unset' }
  unpureAttr Start eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "start", value: unset' }
