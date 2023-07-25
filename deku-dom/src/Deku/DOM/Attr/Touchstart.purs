module Deku.DOM.Attr.Touchstart where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Touchstart = Touchstart

instance Deku.Attribute.Attr everything Touchstart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "touchstart", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Touchstart String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "touchstart", value: _ } <<<
    Deku.Attribute.prop'
