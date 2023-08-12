module Deku.DOM.Attr.PointsAtY where

import Prelude

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PointsAtY = PointsAtY

instance Attr FeSpotLight_ PointsAtY String where
  attr PointsAtY value = unsafeAttribute
    { key: "pointsAtY", value: prop' value }

instance Attr everything PointsAtY Unit where
  attr PointsAtY _ = unsafeAttribute
    { key: "pointsAtY", value: unset' }
