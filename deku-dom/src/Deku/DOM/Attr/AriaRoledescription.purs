module Deku.DOM.Attr.AriaRoledescription where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data AriaRoledescription = AriaRoledescription

instance Deku.Attribute.Attr everything AriaRoledescription Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "aria-roledescription", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything AriaRoledescription String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "aria-roledescription", value: _ } <<<
    Deku.Attribute.prop'
