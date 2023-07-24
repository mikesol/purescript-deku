module Deku.DOM.Attr.AriaChecked where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaChecked = AriaChecked

instance Deku.Attribute.Attr everything AriaChecked Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-checked", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaChecked String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-checked", value: _ } <<<
    Deku.Attribute.prop'
