module Deku.DOM.Attr.Orient where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Orient = Orient

instance Attr Marker_ Orient String where
  attr Orient bothValues = unsafeAttribute $ Both
    { key: "orient", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "orient", value: prop' value })
  pureAttr Orient value = unsafeAttribute $ This
    { key: "orient", value: prop' value }
  unpureAttr Orient eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "orient", value: prop' value }

instance Attr everything Orient Unit where
  attr Orient bothValues = unsafeAttribute $ Both
    { key: "orient", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "orient", value: unset' })
  pureAttr Orient _ = unsafeAttribute $ This { key: "orient", value: unset' }
  unpureAttr Orient eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "orient", value: unset' }
