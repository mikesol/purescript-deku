module Deku.DOM.Attr.Playing where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Playing = Playing

instance Deku.Attribute.Attr everything Playing Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "playing", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Playing String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "playing", value: _ } <<< Deku.Attribute.prop'
