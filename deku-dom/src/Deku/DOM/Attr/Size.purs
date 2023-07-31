module Deku.DOM.Attr.Size where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Hr (Hr_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)

data Size = Size

instance Deku.Attribute.Attr everything Size Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "size", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Hr_ Size String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "size", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Input_ Size String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "size", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Select_ Size String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "size", value: _ } <<< Deku.Attribute.prop'
