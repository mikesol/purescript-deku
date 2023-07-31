module Deku.DOM.Attr.FillSize where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data FillSize = FillSize

instance Deku.Attribute.Attr everything FillSize Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "fill-size", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything FillSize String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fill-size", value: _ } <<<
    Deku.Attribute.prop'
