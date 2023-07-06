module Deku.DOM.Attr.PointsAtZ where

import Prelude

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PointsAtZ = PointsAtZ

instance Attr FeSpotLight_ PointsAtZ String where
  attr PointsAtZ value = unsafeAttribute
    { key: "pointsAtZ", value: prop' value }

instance Attr everything PointsAtZ Unit where
  attr PointsAtZ _ = unsafeAttribute
    { key: "pointsAtZ", value: unset' }
