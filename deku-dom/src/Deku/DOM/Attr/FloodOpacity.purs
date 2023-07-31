module Deku.DOM.Attr.FloodOpacity where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data FloodOpacity = FloodOpacity

instance Deku.Attribute.Attr everything FloodOpacity Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "flood-opacity", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything FloodOpacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "flood-opacity", value: _ } <<<
    Deku.Attribute.prop'
