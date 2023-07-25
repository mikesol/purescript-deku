module Deku.DOM.Attr.Dragstart where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Dragstart = Dragstart

instance Deku.Attribute.Attr everything Dragstart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "dragstart", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Dragstart String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dragstart", value: _ } <<<
    Deku.Attribute.prop'
