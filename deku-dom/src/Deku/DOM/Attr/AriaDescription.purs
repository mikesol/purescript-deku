module Deku.DOM.Attr.AriaDescription where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaDescription = AriaDescription

instance Deku.Attribute.Attr everything AriaDescription Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "aria-description", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaDescription String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-description", value: _ } <<<
    Deku.Attribute.prop'
