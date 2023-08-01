module Deku.DOM.Attr.Border where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Table (Table_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Border = Border

instance Attr Img_ Border String where
  attr Border bothValues = unsafeAttribute $ Both
    { key: "border", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "border", value: prop' value })
  pureAttr Border value = unsafeAttribute $ This
    { key: "border", value: prop' value }
  unpureAttr Border eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "border", value: prop' value }

instance Attr Object_ Border String where
  attr Border bothValues = unsafeAttribute $ Both
    { key: "border", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "border", value: prop' value })
  pureAttr Border value = unsafeAttribute $ This
    { key: "border", value: prop' value }
  unpureAttr Border eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "border", value: prop' value }

instance Attr Table_ Border String where
  attr Border bothValues = unsafeAttribute $ Both
    { key: "border", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "border", value: prop' value })
  pureAttr Border value = unsafeAttribute $ This
    { key: "border", value: prop' value }
  unpureAttr Border eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "border", value: prop' value }

instance Attr everything Border Unit where
  attr Border bothValues = unsafeAttribute $ Both
    { key: "border", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "border", value: unset' })
  pureAttr Border _ = unsafeAttribute $ This { key: "border", value: unset' }
  unpureAttr Border eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "border", value: unset' }
