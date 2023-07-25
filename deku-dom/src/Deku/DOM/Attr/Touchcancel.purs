module Deku.DOM.Attr.Touchcancel where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Touchcancel = Touchcancel

instance Deku.Attribute.Attr everything Touchcancel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "touchcancel", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Touchcancel String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "touchcancel", value: _ } <<<
    Deku.Attribute.prop'
