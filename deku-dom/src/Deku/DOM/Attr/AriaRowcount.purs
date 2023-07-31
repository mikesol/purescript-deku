module Deku.DOM.Attr.AriaRowcount where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaRowcount = AriaRowcount

instance Deku.Attribute.Attr everything AriaRowcount Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-rowcount", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaRowcount String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-rowcount", value: _ } <<<
    Deku.Attribute.prop'
