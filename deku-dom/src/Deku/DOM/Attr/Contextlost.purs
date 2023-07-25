module Deku.DOM.Attr.Contextlost where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Contextlost = Contextlost

instance Deku.Attribute.Attr everything Contextlost Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "contextlost", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Contextlost String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "contextlost", value: _ } <<<
    Deku.Attribute.prop'
