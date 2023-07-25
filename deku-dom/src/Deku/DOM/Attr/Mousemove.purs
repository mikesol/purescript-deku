module Deku.DOM.Attr.Mousemove where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Mousemove = Mousemove

instance Deku.Attribute.Attr everything Mousemove Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "mousemove", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Mousemove String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "mousemove", value: _ } <<<
    Deku.Attribute.prop'
