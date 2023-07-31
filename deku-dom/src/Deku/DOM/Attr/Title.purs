module Deku.DOM.Attr.Title where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Title = Title

instance Deku.Attribute.Attr everything Title Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "title", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Title String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "title", value: _ } <<< Deku.Attribute.prop'
