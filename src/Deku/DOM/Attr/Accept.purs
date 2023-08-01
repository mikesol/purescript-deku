module Deku.DOM.Attr.Accept where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Form (Form_)
import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Accept = Accept

instance Attr Form_ Accept String where
  attr Accept bothValues = unsafeAttribute $ Both
    { key: "accept", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "accept", value: prop' value })
  pureAttr Accept value = unsafeAttribute $ This
    { key: "accept", value: prop' value }
  unpureAttr Accept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accept", value: prop' value }

instance Attr Input_ Accept String where
  attr Accept bothValues = unsafeAttribute $ Both
    { key: "accept", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "accept", value: prop' value })
  pureAttr Accept value = unsafeAttribute $ This
    { key: "accept", value: prop' value }
  unpureAttr Accept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "accept", value: prop' value }

instance Attr everything Accept Unit where
  attr Accept bothValues = unsafeAttribute $ Both
    { key: "accept", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "accept", value: unset' })
  pureAttr Accept _ = unsafeAttribute $ This { key: "accept", value: unset' }
  unpureAttr Accept eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "accept", value: unset' }
