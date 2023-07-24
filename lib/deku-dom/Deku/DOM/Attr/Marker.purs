module Deku.DOM.Attr.Marker where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Marker = Marker

instance Deku.Attribute.Attr everything Marker Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "marker", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Marker String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "marker", value: _ } <<< Deku.Attribute.prop'
