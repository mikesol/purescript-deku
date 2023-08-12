module Deku.DOM.Attr.PointsAtX where

import Prelude

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PointsAtX = PointsAtX

instance Attr FeSpotLight_ PointsAtX String where
  attr PointsAtX value = unsafeAttribute
    { key: "pointsAtX", value: prop' value }

instance Attr everything PointsAtX Unit where
  attr PointsAtX _ = unsafeAttribute
    { key: "pointsAtX", value: unset' }
