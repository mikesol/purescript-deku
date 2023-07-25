module Deku.DOM.Attr.Dragover where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Dragover = Dragover

instance Deku.Attribute.Attr everything Dragover Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "dragover", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Dragover String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dragover", value: _ } <<< Deku.Attribute.prop'
