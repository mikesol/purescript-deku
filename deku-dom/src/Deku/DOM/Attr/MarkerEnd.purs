module Deku.DOM.Attr.MarkerEnd where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data MarkerEnd = MarkerEnd

instance Deku.Attribute.Attr everything MarkerEnd Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "marker-end", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything MarkerEnd String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "marker-end", value: _ } <<<
    Deku.Attribute.prop'
