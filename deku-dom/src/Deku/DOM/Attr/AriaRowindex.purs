module Deku.DOM.Attr.AriaRowindex where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaRowindex = AriaRowindex

instance Deku.Attribute.Attr everything AriaRowindex Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-rowindex", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaRowindex String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-rowindex", value: _ } <<<
    Deku.Attribute.prop'
