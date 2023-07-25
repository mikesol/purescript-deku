module Deku.DOM.Attr.Seeking where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Seeking = Seeking

instance Deku.Attribute.Attr everything Seeking Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "seeking", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Seeking String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "seeking", value: _ } <<< Deku.Attribute.prop'
