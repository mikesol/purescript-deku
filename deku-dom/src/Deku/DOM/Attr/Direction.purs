module Deku.DOM.Attr.Direction where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Marquee (Marquee_)

data Direction = Direction

instance Deku.Attribute.Attr everything Direction Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "direction", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Marquee_ Direction String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "direction", value: _ } <<<
    Deku.Attribute.prop'
