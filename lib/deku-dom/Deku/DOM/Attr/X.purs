module Deku.DOM.Attr.X where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data X = X

instance Deku.Attribute.Attr everything X Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "x", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything X String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "x", value: _ } <<< Deku.Attribute.prop'
