module Deku.DOM.Attr.PointsAtX where

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data PointsAtX = PointsAtX

instance Attr FeSpotLight_ PointsAtX String where
  attr PointsAtX value = unsafeAttribute { key: "pointsAtX", value: prop' value }