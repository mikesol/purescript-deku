module Deku.DOM.Attr.Drag where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Drag = Drag

instance Deku.Attribute.Attr everything Drag Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "drag", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Drag String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "drag", value: _ } <<< Deku.Attribute.prop'
