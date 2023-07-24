module Deku.DOM.Attr.Cols where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Textarea (Textarea_)

data Cols = Cols

instance Deku.Attribute.Attr everything Cols Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "cols", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Textarea_ Cols String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "cols", value: _ } <<< Deku.Attribute.prop'
