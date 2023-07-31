module Deku.DOM.Attr.AriaValuenow where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaValuenow = AriaValuenow

instance Deku.Attribute.Attr everything AriaValuenow Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-valuenow", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaValuenow String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-valuenow", value: _ } <<<
    Deku.Attribute.prop'
