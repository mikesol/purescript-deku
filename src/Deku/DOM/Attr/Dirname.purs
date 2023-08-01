module Deku.DOM.Attr.Dirname where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Dirname = Dirname

instance Attr Input_ Dirname String where
  attr Dirname bothValues = unsafeAttribute $ Both
    { key: "dirname", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "dirname", value: prop' value })
  pureAttr Dirname value = unsafeAttribute $ This
    { key: "dirname", value: prop' value }
  unpureAttr Dirname eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dirname", value: prop' value }

instance Attr Textarea_ Dirname String where
  attr Dirname bothValues = unsafeAttribute $ Both
    { key: "dirname", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "dirname", value: prop' value })
  pureAttr Dirname value = unsafeAttribute $ This
    { key: "dirname", value: prop' value }
  unpureAttr Dirname eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "dirname", value: prop' value }

instance Attr everything Dirname Unit where
  attr Dirname bothValues = unsafeAttribute $ Both
    { key: "dirname", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "dirname", value: unset' })
  pureAttr Dirname _ = unsafeAttribute $ This { key: "dirname", value: unset' }
  unpureAttr Dirname eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "dirname", value: unset' }
