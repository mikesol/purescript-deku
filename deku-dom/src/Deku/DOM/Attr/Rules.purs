module Deku.DOM.Attr.Rules where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Table (Table_)

data Rules = Rules

instance Deku.Attribute.Attr everything Rules Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "rules", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Table_ Rules String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "rules", value: _ } <<< Deku.Attribute.prop'
