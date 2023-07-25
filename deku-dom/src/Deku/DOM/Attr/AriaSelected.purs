module Deku.DOM.Attr.AriaSelected where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaSelected = AriaSelected

instance Deku.Attribute.Attr everything AriaSelected Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-selected", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaSelected String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-selected", value: _ } <<<
    Deku.Attribute.prop'
