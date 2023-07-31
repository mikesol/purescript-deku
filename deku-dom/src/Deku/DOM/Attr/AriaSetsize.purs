module Deku.DOM.Attr.AriaSetsize where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaSetsize = AriaSetsize

instance Deku.Attribute.Attr everything AriaSetsize Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "aria-setsize", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaSetsize String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-setsize", value: _ } <<<
    Deku.Attribute.prop'
