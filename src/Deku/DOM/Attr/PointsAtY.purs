module Deku.DOM.Attr.PointsAtY where

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data PointsAtY = PointsAtY

instance Attr FeSpotLight_ PointsAtY String where
  attr PointsAtY value = unsafeAttribute
    { key: "pointsAtY", value: prop' value }