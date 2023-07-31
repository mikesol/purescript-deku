module Deku.DOM.Attr.AriaControls where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaControls = AriaControls

instance Deku.Attribute.Attr everything AriaControls Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-controls", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaControls String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-controls", value: _ } <<<
    Deku.Attribute.prop'
