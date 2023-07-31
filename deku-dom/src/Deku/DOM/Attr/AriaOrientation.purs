module Deku.DOM.Attr.AriaOrientation where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaOrientation = AriaOrientation

instance Deku.Attribute.Attr everything AriaOrientation Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "aria-orientation", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaOrientation String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-orientation", value: _ } <<<
    Deku.Attribute.prop'
