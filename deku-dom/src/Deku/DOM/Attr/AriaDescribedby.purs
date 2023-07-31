module Deku.DOM.Attr.AriaDescribedby where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaDescribedby = AriaDescribedby

instance Deku.Attribute.Attr everything AriaDescribedby Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "aria-describedby", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaDescribedby String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-describedby", value: _ } <<<
    Deku.Attribute.prop'
