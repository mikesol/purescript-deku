module Deku.DOM.Attr.MarkerHeight where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MarkerHeight = MarkerHeight

instance Attr Marker_ MarkerHeight String where
  attr MarkerHeight bothValues = unsafeAttribute $ Both
    { key: "markerHeight", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "markerHeight", value: prop' value })
  pureAttr MarkerHeight value = unsafeAttribute $ This
    { key: "markerHeight", value: prop' value }
  unpureAttr MarkerHeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "markerHeight", value: prop' value }

instance Attr everything MarkerHeight Unit where
  attr MarkerHeight bothValues = unsafeAttribute $ Both
    { key: "markerHeight", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "markerHeight", value: unset' })
  pureAttr MarkerHeight _ = unsafeAttribute $ This
    { key: "markerHeight", value: unset' }
  unpureAttr MarkerHeight eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "markerHeight", value: unset' }
