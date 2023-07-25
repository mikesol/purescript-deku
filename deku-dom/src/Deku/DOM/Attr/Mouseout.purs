module Deku.DOM.Attr.Mouseout where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Mouseout = Mouseout

instance Deku.Attribute.Attr everything Mouseout Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "mouseout", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Mouseout String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "mouseout", value: _ } <<< Deku.Attribute.prop'
