module Deku.DOM.Attr.Points where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Polyline (Polyline_)

data Points = Points

instance Deku.Attribute.Attr everything Points Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "points", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Polygon_ Points String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "points", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Polyline_ Points String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "points", value: _ } <<< Deku.Attribute.prop'
