module Deku.DOM.Attr.PointsAtX where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PointsAtX = PointsAtX

instance Attr FeSpotLight_ PointsAtX String where
  attr PointsAtX bothValues = unsafeAttribute $ Both
    { key: "pointsAtX", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pointsAtX", value: prop' value })
  pureAttr PointsAtX value = unsafeAttribute $ This
    { key: "pointsAtX", value: prop' value }
  unpureAttr PointsAtX eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointsAtX", value: prop' value }

instance Attr everything PointsAtX Unit where
  attr PointsAtX bothValues = unsafeAttribute $ Both
    { key: "pointsAtX", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointsAtX", value: unset' })
  pureAttr PointsAtX _ = unsafeAttribute $ This
    { key: "pointsAtX", value: unset' }
  unpureAttr PointsAtX eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointsAtX", value: unset' }
