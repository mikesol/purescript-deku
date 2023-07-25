module Deku.DOM.Attr.AriaLevel where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaLevel = AriaLevel

instance Deku.Attribute.Attr everything AriaLevel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-level", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaLevel String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-level", value: _ } <<<
    Deku.Attribute.prop'
