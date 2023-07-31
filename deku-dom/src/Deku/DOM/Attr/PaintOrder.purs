module Deku.DOM.Attr.PaintOrder where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data PaintOrder = PaintOrder

instance Deku.Attribute.Attr everything PaintOrder Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "paint-order", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything PaintOrder String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "paint-order", value: _ } <<<
    Deku.Attribute.prop'
