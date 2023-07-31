module Deku.DOM.Attr.R where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data R = R

instance Deku.Attribute.Attr everything R Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "r", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything R String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "r", value: _ } <<< Deku.Attribute.prop'
