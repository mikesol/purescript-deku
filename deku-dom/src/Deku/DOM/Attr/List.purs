module Deku.DOM.Attr.List where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Input (Input_)

data List = List

instance Deku.Attribute.Attr everything List Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "list", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Input_ List String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "list", value: _ } <<< Deku.Attribute.prop'
