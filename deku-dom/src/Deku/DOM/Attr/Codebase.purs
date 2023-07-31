module Deku.DOM.Attr.Codebase where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Object (Object_)

data Codebase = Codebase

instance Deku.Attribute.Attr everything Codebase Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "codebase", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Object_ Codebase String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "codebase", value: _ } <<< Deku.Attribute.prop'
