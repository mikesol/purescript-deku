module Deku.DOM.Attr.Datetime where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Del (Del_)
import Deku.DOM.Elt.Ins (Ins_)
import Deku.DOM.Elt.Time (Time_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Datetime = Datetime

instance Attr Del_ Datetime String where
  attr Datetime bothValues = unsafeAttribute $ Both
    { key: "datetime", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "datetime", value: prop' value })
  pureAttr Datetime value = unsafeAttribute $ This
    { key: "datetime", value: prop' value }
  unpureAttr Datetime eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "datetime", value: prop' value }

instance Attr Ins_ Datetime String where
  attr Datetime bothValues = unsafeAttribute $ Both
    { key: "datetime", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "datetime", value: prop' value })
  pureAttr Datetime value = unsafeAttribute $ This
    { key: "datetime", value: prop' value }
  unpureAttr Datetime eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "datetime", value: prop' value }

instance Attr Time_ Datetime String where
  attr Datetime bothValues = unsafeAttribute $ Both
    { key: "datetime", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "datetime", value: prop' value })
  pureAttr Datetime value = unsafeAttribute $ This
    { key: "datetime", value: prop' value }
  unpureAttr Datetime eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "datetime", value: prop' value }

instance Attr everything Datetime Unit where
  attr Datetime bothValues = unsafeAttribute $ Both
    { key: "datetime", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "datetime", value: unset' })
  pureAttr Datetime _ = unsafeAttribute $ This
    { key: "datetime", value: unset' }
  unpureAttr Datetime eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "datetime", value: unset' }
