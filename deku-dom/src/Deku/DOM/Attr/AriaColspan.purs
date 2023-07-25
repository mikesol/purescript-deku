module Deku.DOM.Attr.AriaColspan where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaColspan = AriaColspan

instance Deku.Attribute.Attr everything AriaColspan Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-colspan", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaColspan String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-colspan", value: _ } <<<
    Deku.Attribute.prop'
