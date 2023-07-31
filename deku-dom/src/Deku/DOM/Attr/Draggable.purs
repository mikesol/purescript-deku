module Deku.DOM.Attr.Draggable where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Draggable = Draggable

instance Deku.Attribute.Attr everything Draggable Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "draggable", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Draggable String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "draggable", value: _ } <<<
    Deku.Attribute.prop'
