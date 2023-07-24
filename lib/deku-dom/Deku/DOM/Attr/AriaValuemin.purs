module Deku.DOM.Attr.AriaValuemin where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaValuemin = AriaValuemin

instance Deku.Attribute.Attr everything AriaValuemin Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-valuemin", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaValuemin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-valuemin", value: _ } <<<
    Deku.Attribute.prop'
