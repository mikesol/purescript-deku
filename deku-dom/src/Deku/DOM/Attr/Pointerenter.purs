module Deku.DOM.Attr.Pointerenter where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Pointerenter = Pointerenter

instance Deku.Attribute.Attr everything Pointerenter Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pointerenter", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Pointerenter String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerenter", value: _ } <<<
    Deku.Attribute.prop'
