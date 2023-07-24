module Deku.DOM.Attr.AriaInvalid where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaInvalid = AriaInvalid

instance Deku.Attribute.Attr everything AriaInvalid Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-invalid", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaInvalid String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-invalid", value: _ } <<<
    Deku.Attribute.prop'
