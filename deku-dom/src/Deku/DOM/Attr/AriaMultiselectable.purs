module Deku.DOM.Attr.AriaMultiselectable where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaMultiselectable = AriaMultiselectable

instance Deku.Attribute.Attr everything AriaMultiselectable Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "aria-multiselectable", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaMultiselectable String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-multiselectable", value: _ } <<<
    Deku.Attribute.prop'
