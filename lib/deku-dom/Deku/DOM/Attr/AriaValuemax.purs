module Deku.DOM.Attr.AriaValuemax where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaValuemax = AriaValuemax

instance Deku.Attribute.Attr everything AriaValuemax Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-valuemax", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaValuemax String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-valuemax", value: _ } <<<
    Deku.Attribute.prop'
