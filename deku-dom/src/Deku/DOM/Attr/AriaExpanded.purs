module Deku.DOM.Attr.AriaExpanded where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaExpanded = AriaExpanded

instance Deku.Attribute.Attr everything AriaExpanded Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-expanded", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaExpanded String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-expanded", value: _ } <<<
    Deku.Attribute.prop'
