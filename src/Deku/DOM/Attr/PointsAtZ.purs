module Deku.DOM.Attr.PointsAtZ where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PointsAtZ = PointsAtZ

instance Attr FeSpotLight_ PointsAtZ (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointsAtZ bothValues = unsafeAttribute $ Both
    { key: "pointsAtZ", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pointsAtZ", value: prop' value })
instance Attr FeSpotLight_ PointsAtZ  String  where
  attr PointsAtZ value = unsafeAttribute $ This
    { key: "pointsAtZ", value: prop' value }
instance Attr FeSpotLight_ PointsAtZ (Event.Event  String ) where
  attr PointsAtZ eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointsAtZ", value: prop' value }

instance Attr everything PointsAtZ (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PointsAtZ bothValues = unsafeAttribute $ Both
    { key: "pointsAtZ", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointsAtZ", value: unset' })
instance Attr everything PointsAtZ  Unit  where
  attr PointsAtZ _ = unsafeAttribute $ This
    { key: "pointsAtZ", value: unset' }
instance Attr everything PointsAtZ (Event.Event  Unit ) where
  attr PointsAtZ eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointsAtZ", value: unset' }
