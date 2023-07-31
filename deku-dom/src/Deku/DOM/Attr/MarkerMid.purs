module Deku.DOM.Attr.MarkerMid where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data MarkerMid = MarkerMid

instance Deku.Attribute.Attr everything MarkerMid Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "marker-mid", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything MarkerMid String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "marker-mid", value: _ } <<<
    Deku.Attribute.prop'
