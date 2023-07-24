module Deku.DOM.Attr.AriaPressed where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaPressed = AriaPressed

instance Deku.Attribute.Attr everything AriaPressed Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-pressed", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaPressed String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-pressed", value: _ } <<<
    Deku.Attribute.prop'
