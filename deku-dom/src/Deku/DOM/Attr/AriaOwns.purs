module Deku.DOM.Attr.AriaOwns where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaOwns = AriaOwns

instance Deku.Attribute.Attr everything AriaOwns Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-owns", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaOwns String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-owns", value: _ } <<<
    Deku.Attribute.prop'
