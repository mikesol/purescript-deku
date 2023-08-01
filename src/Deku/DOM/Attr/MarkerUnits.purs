module Deku.DOM.Attr.MarkerUnits where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MarkerUnits = MarkerUnits

instance Attr Marker_ MarkerUnits String where
  attr MarkerUnits bothValues = unsafeAttribute $ Both
    { key: "markerUnits", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "markerUnits", value: prop' value })
  pureAttr MarkerUnits value = unsafeAttribute $ This
    { key: "markerUnits", value: prop' value }
  unpureAttr MarkerUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "markerUnits", value: prop' value }

instance Attr everything MarkerUnits Unit where
  attr MarkerUnits bothValues = unsafeAttribute $ Both
    { key: "markerUnits", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "markerUnits", value: unset' })
  pureAttr MarkerUnits _ = unsafeAttribute $ This
    { key: "markerUnits", value: unset' }
  unpureAttr MarkerUnits eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "markerUnits", value: unset' }
