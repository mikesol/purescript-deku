module Deku.DOM.Attr.AriaLabelledby where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaLabelledby = AriaLabelledby

instance Deku.Attribute.Attr everything AriaLabelledby Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-labelledby", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaLabelledby String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-labelledby", value: _ } <<<
    Deku.Attribute.prop'
