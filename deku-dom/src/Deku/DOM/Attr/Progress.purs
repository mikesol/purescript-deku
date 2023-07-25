module Deku.DOM.Attr.Progress where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Progress = Progress

instance Deku.Attribute.Attr everything Progress Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "progress", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Progress String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "progress", value: _ } <<< Deku.Attribute.prop'
