module Deku.DOM.Attr.Canplaythrough where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Canplaythrough = Canplaythrough

instance Deku.Attribute.Attr everything Canplaythrough Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "canplaythrough", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Canplaythrough String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "canplaythrough", value: _ } <<<
    Deku.Attribute.prop'
