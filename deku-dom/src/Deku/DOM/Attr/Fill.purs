module Deku.DOM.Attr.Fill where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Fill = Fill

instance Deku.Attribute.Attr everything Fill Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "fill", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Fill String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "fill", value: _ } <<< Deku.Attribute.prop'
