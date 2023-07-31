module Deku.DOM.Attr.Multiple where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)

data Multiple = Multiple

instance Deku.Attribute.Attr everything Multiple Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "multiple", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Input_ Multiple String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "multiple", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Select_ Multiple String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "multiple", value: _ } <<< Deku.Attribute.prop'
