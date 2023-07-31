module Deku.DOM.Attr.FillImage where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data FillImage = FillImage

instance Deku.Attribute.Attr everything FillImage Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "fill-image", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything FillImage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fill-image", value: _ } <<<
    Deku.Attribute.prop'
