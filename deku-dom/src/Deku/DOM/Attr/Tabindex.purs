module Deku.DOM.Attr.Tabindex where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Tabindex = Tabindex

instance Deku.Attribute.Attr everything Tabindex Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "tabindex", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Tabindex String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "tabindex", value: _ } <<< Deku.Attribute.prop'
