module Deku.DOM.Attr.Dragleave where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Dragleave = Dragleave

instance Deku.Attribute.Attr everything Dragleave Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "dragleave", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Dragleave String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dragleave", value: _ } <<<
    Deku.Attribute.prop'
