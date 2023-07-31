module Deku.DOM.Attr.AriaDetails where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaDetails = AriaDetails

instance Deku.Attribute.Attr everything AriaDetails Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-details", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaDetails String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-details", value: _ } <<<
    Deku.Attribute.prop'
