module Deku.DOM.Attr.AriaPosinset where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaPosinset = AriaPosinset

instance Deku.Attribute.Attr everything AriaPosinset Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-posinset", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaPosinset String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-posinset", value: _ } <<<
    Deku.Attribute.prop'
