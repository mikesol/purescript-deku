module Deku.DOM.Attr.Rowspan where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rowspan = Rowspan

instance Attr Td_ Rowspan String where
  attr Rowspan bothValues = unsafeAttribute $ Both
    { key: "rowspan", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "rowspan", value: prop' value })
  pureAttr Rowspan value = unsafeAttribute $ This
    { key: "rowspan", value: prop' value }
  unpureAttr Rowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "rowspan", value: prop' value }

instance Attr Th_ Rowspan String where
  attr Rowspan bothValues = unsafeAttribute $ Both
    { key: "rowspan", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "rowspan", value: prop' value })
  pureAttr Rowspan value = unsafeAttribute $ This
    { key: "rowspan", value: prop' value }
  unpureAttr Rowspan eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "rowspan", value: prop' value }

instance Attr everything Rowspan Unit where
  attr Rowspan bothValues = unsafeAttribute $ Both
    { key: "rowspan", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "rowspan", value: unset' })
  pureAttr Rowspan _ = unsafeAttribute $ This { key: "rowspan", value: unset' }
  unpureAttr Rowspan eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "rowspan", value: unset' }
