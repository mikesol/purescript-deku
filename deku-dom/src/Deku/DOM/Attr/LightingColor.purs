module Deku.DOM.Attr.LightingColor where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data LightingColor = LightingColor

instance Deku.Attribute.Attr everything LightingColor Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "lighting-color", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything LightingColor String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "lighting-color", value: _ } <<<
    Deku.Attribute.prop'
