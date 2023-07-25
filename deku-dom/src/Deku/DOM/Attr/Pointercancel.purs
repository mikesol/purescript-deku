module Deku.DOM.Attr.Pointercancel where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Pointercancel = Pointercancel

instance Deku.Attribute.Attr everything Pointercancel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pointercancel", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Pointercancel String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointercancel", value: _ } <<<
    Deku.Attribute.prop'
