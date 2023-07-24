module Deku.DOM.Attr.MarkerWidth where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Marker (Marker_)

data MarkerWidth = MarkerWidth

instance Deku.Attribute.Attr everything MarkerWidth Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "markerWidth", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Marker_ MarkerWidth String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "markerWidth", value: _ } <<<
    Deku.Attribute.prop'
