module Deku.DOM.Attr.Background where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Background = Background

instance Attr Body_ Background String where
  attr Background bothValues = unsafeAttribute $ Both
    { key: "background", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "background", value: prop' value })
  pureAttr Background value = unsafeAttribute $ This
    { key: "background", value: prop' value }
  unpureAttr Background eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "background", value: prop' value }

instance Attr Table_ Background String where
  attr Background bothValues = unsafeAttribute $ Both
    { key: "background", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "background", value: prop' value })
  pureAttr Background value = unsafeAttribute $ This
    { key: "background", value: prop' value }
  unpureAttr Background eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "background", value: prop' value }

instance Attr Td_ Background String where
  attr Background bothValues = unsafeAttribute $ Both
    { key: "background", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "background", value: prop' value })
  pureAttr Background value = unsafeAttribute $ This
    { key: "background", value: prop' value }
  unpureAttr Background eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "background", value: prop' value }

instance Attr Th_ Background String where
  attr Background bothValues = unsafeAttribute $ Both
    { key: "background", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "background", value: prop' value })
  pureAttr Background value = unsafeAttribute $ This
    { key: "background", value: prop' value }
  unpureAttr Background eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "background", value: prop' value }

instance Attr everything Background Unit where
  attr Background bothValues = unsafeAttribute $ Both
    { key: "background", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "background", value: unset' })
  pureAttr Background _ = unsafeAttribute $ This
    { key: "background", value: unset' }
  unpureAttr Background eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "background", value: unset' }
