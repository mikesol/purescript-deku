module Deku.DOM.Attr.AriaRowspan where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaRowspan = AriaRowspan

instance Deku.Attribute.Attr everything AriaRowspan Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-rowspan", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaRowspan String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-rowspan", value: _ } <<<
    Deku.Attribute.prop'
