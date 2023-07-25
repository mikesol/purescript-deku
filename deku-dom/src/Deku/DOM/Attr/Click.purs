module Deku.DOM.Attr.Click where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Click = Click

instance Deku.Attribute.Attr everything Click Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "click", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Click String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "click", value: _ } <<< Deku.Attribute.prop'
