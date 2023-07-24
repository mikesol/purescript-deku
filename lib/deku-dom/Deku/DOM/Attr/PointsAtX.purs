module Deku.DOM.Attr.PointsAtX where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)

data PointsAtX = PointsAtX

instance Deku.Attribute.Attr everything PointsAtX Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pointsAtX", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeSpotLight_ PointsAtX String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointsAtX", value: _ } <<<
    Deku.Attribute.prop'
