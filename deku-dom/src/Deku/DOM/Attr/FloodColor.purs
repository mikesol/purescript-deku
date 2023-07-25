module Deku.DOM.Attr.FloodColor where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data FloodColor = FloodColor

instance Deku.Attribute.Attr everything FloodColor Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "flood-color", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything FloodColor String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "flood-color", value: _ } <<<
    Deku.Attribute.prop'
