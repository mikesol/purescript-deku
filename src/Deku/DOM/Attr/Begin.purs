module Deku.DOM.Attr.Begin where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Begin = Begin

instance Attr Animate_ Begin String where
  attr Begin bothValues = unsafeAttribute $ Both
    { key: "begin", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "begin", value: prop' value })
  pureAttr Begin value = unsafeAttribute $ This
    { key: "begin", value: prop' value }
  unpureAttr Begin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "begin", value: prop' value }

instance Attr AnimateMotion_ Begin String where
  attr Begin bothValues = unsafeAttribute $ Both
    { key: "begin", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "begin", value: prop' value })
  pureAttr Begin value = unsafeAttribute $ This
    { key: "begin", value: prop' value }
  unpureAttr Begin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "begin", value: prop' value }

instance Attr AnimateTransform_ Begin String where
  attr Begin bothValues = unsafeAttribute $ Both
    { key: "begin", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "begin", value: prop' value })
  pureAttr Begin value = unsafeAttribute $ This
    { key: "begin", value: prop' value }
  unpureAttr Begin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "begin", value: prop' value }

instance Attr Set_ Begin String where
  attr Begin bothValues = unsafeAttribute $ Both
    { key: "begin", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "begin", value: prop' value })
  pureAttr Begin value = unsafeAttribute $ This
    { key: "begin", value: prop' value }
  unpureAttr Begin eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "begin", value: prop' value }

instance Attr everything Begin Unit where
  attr Begin bothValues = unsafeAttribute $ Both { key: "begin", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "begin", value: unset' })
  pureAttr Begin _ = unsafeAttribute $ This { key: "begin", value: unset' }
  unpureAttr Begin eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "begin", value: unset' }
