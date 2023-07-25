module Deku.DOM.Attr.VectorEffect where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data VectorEffect = VectorEffect

instance Deku.Attribute.Attr everything VectorEffect Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "vector-effect", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything VectorEffect String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "vector-effect", value: _ } <<<
    Deku.Attribute.prop'
