module Deku.DOM.Attr.MarkerHeight where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Marker (Marker_)

data MarkerHeight = MarkerHeight

instance Deku.Attribute.Attr everything MarkerHeight Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "markerHeight", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Marker_ MarkerHeight String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "markerHeight", value: _ } <<<
    Deku.Attribute.prop'
