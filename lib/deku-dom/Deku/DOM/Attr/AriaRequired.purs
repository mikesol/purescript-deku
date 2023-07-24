module Deku.DOM.Attr.AriaRequired where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaRequired = AriaRequired

instance Deku.Attribute.Attr everything AriaRequired Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-required", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaRequired String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-required", value: _ } <<<
    Deku.Attribute.prop'
