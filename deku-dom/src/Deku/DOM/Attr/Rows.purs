module Deku.DOM.Attr.Rows where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Textarea (Textarea_)

data Rows = Rows

instance Deku.Attribute.Attr everything Rows Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "rows", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Textarea_ Rows String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "rows", value: _ } <<< Deku.Attribute.prop'
