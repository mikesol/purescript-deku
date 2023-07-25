module Deku.DOM.Attr.Translate where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Translate = Translate

instance Deku.Attribute.Attr everything Translate Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "translate", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Translate String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "translate", value: _ } <<<
    Deku.Attribute.prop'
