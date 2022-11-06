module Deku.DOM.Attr.PointsAtZ where

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data PointsAtZ = PointsAtZ

instance Attr FeSpotLight_ PointsAtZ String where
  attr PointsAtZ value = unsafeAttribute { key: "pointsAtZ", value: prop' value }