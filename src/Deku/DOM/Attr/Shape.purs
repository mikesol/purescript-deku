module Deku.DOM.Attr.Shape where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Shape = Shape

instance Attr A_ Shape String where
  attr Shape bothValues = unsafeAttribute $ Both
    { key: "shape", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "shape", value: prop' value })
  pureAttr Shape value = unsafeAttribute $ This
    { key: "shape", value: prop' value }
  unpureAttr Shape eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "shape", value: prop' value }

instance Attr Area_ Shape String where
  attr Shape bothValues = unsafeAttribute $ Both
    { key: "shape", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "shape", value: prop' value })
  pureAttr Shape value = unsafeAttribute $ This
    { key: "shape", value: prop' value }
  unpureAttr Shape eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "shape", value: prop' value }

instance Attr everything Shape Unit where
  attr Shape bothValues = unsafeAttribute $ Both { key: "shape", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "shape", value: unset' })
  pureAttr Shape _ = unsafeAttribute $ This { key: "shape", value: unset' }
  unpureAttr Shape eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "shape", value: unset' }
