module Deku.DOM.Attr.Dragenter where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Dragenter = Dragenter

instance Deku.Attribute.Attr everything Dragenter Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "dragenter", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Dragenter String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dragenter", value: _ } <<<
    Deku.Attribute.prop'
