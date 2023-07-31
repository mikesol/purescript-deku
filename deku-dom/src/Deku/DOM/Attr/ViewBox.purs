module Deku.DOM.Attr.ViewBox where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Svg (Svg_)

data ViewBox = ViewBox

instance Deku.Attribute.Attr everything ViewBox Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "viewBox", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Svg_ ViewBox String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "viewBox", value: _ } <<< Deku.Attribute.prop'
