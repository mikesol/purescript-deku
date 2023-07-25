module Deku.DOM.Attr.Mouseup where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Mouseup = Mouseup

instance Deku.Attribute.Attr everything Mouseup Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "mouseup", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Mouseup String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "mouseup", value: _ } <<< Deku.Attribute.prop'
