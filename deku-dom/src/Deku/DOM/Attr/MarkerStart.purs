module Deku.DOM.Attr.MarkerStart where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data MarkerStart = MarkerStart

instance Deku.Attribute.Attr everything MarkerStart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "marker-start", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything MarkerStart String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "marker-start", value: _ } <<<
    Deku.Attribute.prop'
