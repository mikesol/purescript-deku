module Deku.DOM.Attr.AriaHaspopup where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaHaspopup = AriaHaspopup

instance Deku.Attribute.Attr everything AriaHaspopup Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-haspopup", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaHaspopup String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-haspopup", value: _ } <<<
    Deku.Attribute.prop'
