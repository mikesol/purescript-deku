module Deku.DOM.Attr.Required where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.DOM.Elt.Textarea (Textarea_)

data Required = Required

instance Deku.Attribute.Attr everything Required Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "required", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Input_ Required String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "required", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Select_ Required String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "required", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Textarea_ Required String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "required", value: _ } <<< Deku.Attribute.prop'
