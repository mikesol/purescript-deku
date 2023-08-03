module Deku.DOM.Attr.PointsAtX where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PointsAtX = PointsAtX

instance Attr FeSpotLight_ PointsAtX (NonEmpty.NonEmpty Event.Event  String ) where
  attr PointsAtX bothValues = unsafeAttribute $ Both (pure 
    { key: "pointsAtX", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "pointsAtX", value: prop' value })
instance Attr FeSpotLight_ PointsAtX  String  where
  attr PointsAtX value = unsafeAttribute $ This $ pure $
    { key: "pointsAtX", value: prop' value }
instance Attr FeSpotLight_ PointsAtX (Event.Event  String ) where
  attr PointsAtX eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointsAtX", value: prop' value }

instance Attr everything PointsAtX (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr PointsAtX bothValues = unsafeAttribute $ Both (pure 
    { key: "pointsAtX", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointsAtX", value: unset' })
instance Attr everything PointsAtX  Unit  where
  attr PointsAtX _ = unsafeAttribute $ This $ pure $
    { key: "pointsAtX", value: unset' }
instance Attr everything PointsAtX (Event.Event  Unit ) where
  attr PointsAtX eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointsAtX", value: unset' }
