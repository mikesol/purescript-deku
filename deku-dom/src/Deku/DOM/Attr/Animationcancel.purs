module Deku.DOM.Attr.Animationcancel where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Animationcancel = Animationcancel

instance Deku.Attribute.Attr everything Animationcancel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "animationcancel", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Animationcancel String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "animationcancel", value: _ } <<<
    Deku.Attribute.prop'
