module Deku.DOM.Attr.Animationend where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Animationend = Animationend

instance Deku.Attribute.Attr everything Animationend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "animationend", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Animationend String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "animationend", value: _ } <<<
    Deku.Attribute.prop'
