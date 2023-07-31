module Deku.DOM.Attr.Cy where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Cy = Cy

instance Deku.Attribute.Attr everything Cy Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "cy", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Cy String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "cy", value: _ } <<< Deku.Attribute.prop'
