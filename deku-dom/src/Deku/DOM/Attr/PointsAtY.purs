module Deku.DOM.Attr.PointsAtY where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)

data PointsAtY = PointsAtY

instance Deku.Attribute.Attr everything PointsAtY Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pointsAtY", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeSpotLight_ PointsAtY String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointsAtY", value: _ } <<<
    Deku.Attribute.prop'
