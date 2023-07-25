module Deku.DOM.Attr.Animationiteration where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Animationiteration = Animationiteration

instance Deku.Attribute.Attr everything Animationiteration Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "animationiteration", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Animationiteration String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "animationiteration", value: _ } <<<
    Deku.Attribute.prop'
