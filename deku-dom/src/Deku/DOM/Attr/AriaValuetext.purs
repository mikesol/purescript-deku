module Deku.DOM.Attr.AriaValuetext where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaValuetext = AriaValuetext

instance Deku.Attribute.Attr everything AriaValuetext Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-valuetext", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaValuetext String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-valuetext", value: _ } <<<
    Deku.Attribute.prop'
