module Deku.DOM.Attr.Y where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Y = Y

instance Deku.Attribute.Attr everything Y Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "y", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Y String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "y", value: _ } <<< Deku.Attribute.prop'
