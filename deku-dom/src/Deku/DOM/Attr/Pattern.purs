module Deku.DOM.Attr.Pattern where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Input (Input_)

data Pattern = Pattern

instance Deku.Attribute.Attr everything Pattern Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pattern", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Input_ Pattern String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pattern", value: _ } <<< Deku.Attribute.prop'
