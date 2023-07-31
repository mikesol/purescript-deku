module Deku.DOM.Attr.AriaColcount where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaColcount = AriaColcount

instance Deku.Attribute.Attr everything AriaColcount Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-colcount", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaColcount String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-colcount", value: _ } <<<
    Deku.Attribute.prop'
