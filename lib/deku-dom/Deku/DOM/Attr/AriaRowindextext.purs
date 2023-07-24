module Deku.DOM.Attr.AriaRowindextext where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaRowindextext = AriaRowindextext

instance Deku.Attribute.Attr everything AriaRowindextext Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "aria-rowindextext", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaRowindextext String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-rowindextext", value: _ } <<<
    Deku.Attribute.prop'
