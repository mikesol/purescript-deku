module Deku.DOM.Attr.Inputmode where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Inputmode = Inputmode

instance Deku.Attribute.Attr everything Inputmode Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "inputmode", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Inputmode String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "inputmode", value: _ } <<<
    Deku.Attribute.prop'
