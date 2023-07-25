module Deku.DOM.Attr.Abort where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Abort = Abort

instance Deku.Attribute.Attr everything Abort Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "abort", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Abort String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "abort", value: _ } <<< Deku.Attribute.prop'
