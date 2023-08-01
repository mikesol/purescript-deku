module Deku.DOM.Attr.Offset where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Stop (Stop_)
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Offset = Offset

instance Attr FeFuncA_ Offset String where
  attr Offset bothValues = unsafeAttribute $ Both
    { key: "offset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "offset", value: prop' value })
  pureAttr Offset value = unsafeAttribute $ This
    { key: "offset", value: prop' value }
  unpureAttr Offset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr FeFuncB_ Offset String where
  attr Offset bothValues = unsafeAttribute $ Both
    { key: "offset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "offset", value: prop' value })
  pureAttr Offset value = unsafeAttribute $ This
    { key: "offset", value: prop' value }
  unpureAttr Offset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr FeFuncG_ Offset String where
  attr Offset bothValues = unsafeAttribute $ Both
    { key: "offset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "offset", value: prop' value })
  pureAttr Offset value = unsafeAttribute $ This
    { key: "offset", value: prop' value }
  unpureAttr Offset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr FeFuncR_ Offset String where
  attr Offset bothValues = unsafeAttribute $ Both
    { key: "offset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "offset", value: prop' value })
  pureAttr Offset value = unsafeAttribute $ This
    { key: "offset", value: prop' value }
  unpureAttr Offset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr Stop_ Offset String where
  attr Offset bothValues = unsafeAttribute $ Both
    { key: "offset", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "offset", value: prop' value })
  pureAttr Offset value = unsafeAttribute $ This
    { key: "offset", value: prop' value }
  unpureAttr Offset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "offset", value: prop' value }

instance Attr everything Offset Unit where
  attr Offset bothValues = unsafeAttribute $ Both
    { key: "offset", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "offset", value: unset' })
  pureAttr Offset _ = unsafeAttribute $ This { key: "offset", value: unset' }
  unpureAttr Offset eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "offset", value: unset' }
