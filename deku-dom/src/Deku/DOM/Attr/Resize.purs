module Deku.DOM.Attr.Resize where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Resize = Resize

instance Deku.Attribute.Attr everything Resize Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "resize", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Resize String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "resize", value: _ } <<< Deku.Attribute.prop'
