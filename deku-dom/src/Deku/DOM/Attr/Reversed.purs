module Deku.DOM.Attr.Reversed where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Ol (Ol_)

data Reversed = Reversed

instance Deku.Attribute.Attr everything Reversed Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "reversed", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Ol_ Reversed String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "reversed", value: _ } <<< Deku.Attribute.prop'
