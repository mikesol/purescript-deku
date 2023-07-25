module Deku.DOM.Attr.Pointermove where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Pointermove = Pointermove

instance Deku.Attribute.Attr everything Pointermove Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pointermove", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Pointermove String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointermove", value: _ } <<<
    Deku.Attribute.prop'
