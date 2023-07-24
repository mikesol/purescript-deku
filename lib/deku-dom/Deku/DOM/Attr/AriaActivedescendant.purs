module Deku.DOM.Attr.AriaActivedescendant where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaActivedescendant = AriaActivedescendant

instance Deku.Attribute.Attr everything AriaActivedescendant Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "aria-activedescendant", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaActivedescendant String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-activedescendant", value: _ } <<<
    Deku.Attribute.prop'
