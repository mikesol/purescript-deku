module Deku.DOM.Attr.AriaSort where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaSort = AriaSort

instance Deku.Attribute.Attr everything AriaSort Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-sort", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaSort String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-sort", value: _ } <<<
    Deku.Attribute.prop'
