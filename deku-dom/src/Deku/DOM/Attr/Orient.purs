module Deku.DOM.Attr.Orient where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Marker (Marker_)

data Orient = Orient

instance Deku.Attribute.Attr everything Orient Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "orient", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Marker_ Orient String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "orient", value: _ } <<< Deku.Attribute.prop'
