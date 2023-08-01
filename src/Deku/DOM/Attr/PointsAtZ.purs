module Deku.DOM.Attr.PointsAtZ where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PointsAtZ = PointsAtZ

instance Attr FeSpotLight_ PointsAtZ String where
  attr PointsAtZ bothValues = unsafeAttribute $ Both
    { key: "pointsAtZ", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pointsAtZ", value: prop' value })
  pureAttr PointsAtZ value = unsafeAttribute $ This
    { key: "pointsAtZ", value: prop' value }
  unpureAttr PointsAtZ eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointsAtZ", value: prop' value }

instance Attr everything PointsAtZ Unit where
  attr PointsAtZ bothValues = unsafeAttribute $ Both
    { key: "pointsAtZ", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointsAtZ", value: unset' })
  pureAttr PointsAtZ _ = unsafeAttribute $ This
    { key: "pointsAtZ", value: unset' }
  unpureAttr PointsAtZ eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointsAtZ", value: unset' }
