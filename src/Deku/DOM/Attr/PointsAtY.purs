module Deku.DOM.Attr.PointsAtY where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PointsAtY = PointsAtY

instance Attr FeSpotLight_ PointsAtY String where
  attr PointsAtY bothValues = unsafeAttribute $ Both
    { key: "pointsAtY", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pointsAtY", value: prop' value })
  pureAttr PointsAtY value = unsafeAttribute $ This
    { key: "pointsAtY", value: prop' value }
  unpureAttr PointsAtY eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointsAtY", value: prop' value }

instance Attr everything PointsAtY Unit where
  attr PointsAtY bothValues = unsafeAttribute $ Both
    { key: "pointsAtY", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointsAtY", value: unset' })
  pureAttr PointsAtY _ = unsafeAttribute $ This
    { key: "pointsAtY", value: unset' }
  unpureAttr PointsAtY eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointsAtY", value: unset' }
