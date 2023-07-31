module Deku.DOM.Attr.Codetype where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Object (Object_)

data Codetype = Codetype

instance Deku.Attribute.Attr everything Codetype Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "codetype", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Object_ Codetype String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "codetype", value: _ } <<< Deku.Attribute.prop'
