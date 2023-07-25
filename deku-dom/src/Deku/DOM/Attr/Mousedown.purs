module Deku.DOM.Attr.Mousedown where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Mousedown = Mousedown

instance Deku.Attribute.Attr everything Mousedown Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "mousedown", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Mousedown String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "mousedown", value: _ } <<<
    Deku.Attribute.prop'
