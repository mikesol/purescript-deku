module Deku.DOM.Attr.D where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data D = D

instance Deku.Attribute.Attr everything D Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "d", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything D String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "d", value: _ } <<< Deku.Attribute.prop'
