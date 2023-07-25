module Deku.DOM.Attr.Animationstart where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Animationstart = Animationstart

instance Deku.Attribute.Attr everything Animationstart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "animationstart", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Animationstart String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "animationstart", value: _ } <<<
    Deku.Attribute.prop'
