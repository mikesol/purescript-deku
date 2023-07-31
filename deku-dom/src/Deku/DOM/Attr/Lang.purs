module Deku.DOM.Attr.Lang where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Lang = Lang

instance Deku.Attribute.Attr everything Lang Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "lang", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Lang String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "lang", value: _ } <<< Deku.Attribute.prop'
