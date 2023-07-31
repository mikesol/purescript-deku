module Deku.DOM.Attr.AriaPlaceholder where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaPlaceholder = AriaPlaceholder

instance Deku.Attribute.Attr everything AriaPlaceholder Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "aria-placeholder", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaPlaceholder String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-placeholder", value: _ } <<<
    Deku.Attribute.prop'
