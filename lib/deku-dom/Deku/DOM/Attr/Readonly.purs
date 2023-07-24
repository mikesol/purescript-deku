module Deku.DOM.Attr.Readonly where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)

data Readonly = Readonly

instance Deku.Attribute.Attr everything Readonly Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "readonly", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Input_ Readonly String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "readonly", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Textarea_ Readonly String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "readonly", value: _ } <<< Deku.Attribute.prop'
