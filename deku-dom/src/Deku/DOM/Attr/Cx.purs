module Deku.DOM.Attr.Cx where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Cx = Cx

instance Deku.Attribute.Attr everything Cx Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "cx", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Cx String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "cx", value: _ } <<< Deku.Attribute.prop'
