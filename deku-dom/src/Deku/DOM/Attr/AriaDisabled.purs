module Deku.DOM.Attr.AriaDisabled where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaDisabled = AriaDisabled

instance Deku.Attribute.Attr everything AriaDisabled Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-disabled", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaDisabled String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-disabled", value: _ } <<<
    Deku.Attribute.prop'
