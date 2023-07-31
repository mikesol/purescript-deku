module Deku.DOM.Attr.MarkerUnits where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Marker (Marker_)

data MarkerUnits = MarkerUnits

instance Deku.Attribute.Attr everything MarkerUnits Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "markerUnits", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Marker_ MarkerUnits String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "markerUnits", value: _ } <<<
    Deku.Attribute.prop'
