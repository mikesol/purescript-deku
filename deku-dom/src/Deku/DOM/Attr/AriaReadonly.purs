module Deku.DOM.Attr.AriaReadonly where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaReadonly = AriaReadonly

instance Deku.Attribute.Attr everything AriaReadonly Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-readonly", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaReadonly String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-readonly", value: _ } <<<
    Deku.Attribute.prop'
