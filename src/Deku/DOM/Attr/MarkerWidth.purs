module Deku.DOM.Attr.MarkerWidth where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MarkerWidth = MarkerWidth

instance Attr Marker_ MarkerWidth String where
  attr MarkerWidth bothValues = unsafeAttribute $ Both
    { key: "markerWidth", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "markerWidth", value: prop' value })
  pureAttr MarkerWidth value = unsafeAttribute $ This
    { key: "markerWidth", value: prop' value }
  unpureAttr MarkerWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "markerWidth", value: prop' value }

instance Attr everything MarkerWidth Unit where
  attr MarkerWidth bothValues = unsafeAttribute $ Both
    { key: "markerWidth", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "markerWidth", value: unset' })
  pureAttr MarkerWidth _ = unsafeAttribute $ This
    { key: "markerWidth", value: unset' }
  unpureAttr MarkerWidth eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "markerWidth", value: unset' }
