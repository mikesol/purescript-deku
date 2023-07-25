module Deku.DOM.Attr.AriaColindextext where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaColindextext = AriaColindextext

instance Deku.Attribute.Attr everything AriaColindextext Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "aria-colindextext", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaColindextext String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-colindextext", value: _ } <<<
    Deku.Attribute.prop'
