module Deku.DOM.Attr.PointsAtZ where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)

data PointsAtZ = PointsAtZ

instance Deku.Attribute.Attr everything PointsAtZ Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pointsAtZ", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeSpotLight_ PointsAtZ String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointsAtZ", value: _ } <<<
    Deku.Attribute.prop'
