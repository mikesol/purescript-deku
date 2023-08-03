module Deku.DOM.Attr.PointsAtY where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PointsAtY = PointsAtY

instance Attr FeSpotLight_ PointsAtY (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointsAtY bothValues = unsafeAttribute $ Both
    { key: "pointsAtY", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pointsAtY", value: prop' value })
instance Attr FeSpotLight_ PointsAtY  String  where
  attr PointsAtY value = unsafeAttribute $ This $ pure $
    { key: "pointsAtY", value: prop' value }
instance Attr FeSpotLight_ PointsAtY (Event.Event  String ) where
  attr PointsAtY eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointsAtY", value: prop' value }

instance Attr everything PointsAtY (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PointsAtY bothValues = unsafeAttribute $ Both
    { key: "pointsAtY", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointsAtY", value: unset' })
instance Attr everything PointsAtY  Unit  where
  attr PointsAtY _ = unsafeAttribute $ This $ pure $
    { key: "pointsAtY", value: unset' }
instance Attr everything PointsAtY (Event.Event  Unit ) where
  attr PointsAtY eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointsAtY", value: unset' }
