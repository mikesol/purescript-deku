module Deku.DOM.Attr.AriaKeyshortcuts where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaKeyshortcuts = AriaKeyshortcuts

instance Deku.Attribute.Attr everything AriaKeyshortcuts Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "aria-keyshortcuts", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaKeyshortcuts String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-keyshortcuts", value: _ } <<<
    Deku.Attribute.prop'
