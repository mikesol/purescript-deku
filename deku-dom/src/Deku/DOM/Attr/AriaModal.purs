module Deku.DOM.Attr.AriaModal where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaModal = AriaModal

instance Deku.Attribute.Attr everything AriaModal Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-modal", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaModal String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-modal", value: _ } <<<
    Deku.Attribute.prop'
