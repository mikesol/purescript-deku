module Deku.DOM.Attr.AriaLabel where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaLabel = AriaLabel

instance Deku.Attribute.Attr everything AriaLabel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-label", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaLabel String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-label", value: _ } <<<
    Deku.Attribute.prop'
