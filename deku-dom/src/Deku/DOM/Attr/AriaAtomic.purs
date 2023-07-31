module Deku.DOM.Attr.AriaAtomic where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaAtomic = AriaAtomic

instance Deku.Attribute.Attr everything AriaAtomic Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-atomic", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaAtomic String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-atomic", value: _ } <<<
    Deku.Attribute.prop'
