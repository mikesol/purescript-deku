module Deku.DOM.Attr.ImageRendering where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data ImageRendering = ImageRendering

instance Deku.Attribute.Attr everything ImageRendering Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "image-rendering", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything ImageRendering String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "image-rendering", value: _ } <<<
    Deku.Attribute.prop'
