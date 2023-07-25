module Deku.DOM.Attr.AriaMultiline where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaMultiline = AriaMultiline

instance Deku.Attribute.Attr everything AriaMultiline Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-multiline", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaMultiline String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-multiline", value: _ } <<<
    Deku.Attribute.prop'
