module Deku.DOM.Attr.Focus where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Focus = Focus

instance Deku.Attribute.Attr everything Focus Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "focus", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Focus String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "focus", value: _ } <<< Deku.Attribute.prop'
