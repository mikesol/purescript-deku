module Deku.DOM.Attr.AriaHidden where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaHidden = AriaHidden

instance Deku.Attribute.Attr everything AriaHidden Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-hidden", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaHidden String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-hidden", value: _ } <<<
    Deku.Attribute.prop'
