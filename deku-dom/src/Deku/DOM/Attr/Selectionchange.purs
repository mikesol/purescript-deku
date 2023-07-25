module Deku.DOM.Attr.Selectionchange where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Selectionchange = Selectionchange

instance Deku.Attribute.Attr everything Selectionchange Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "selectionchange", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Selectionchange String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "selectionchange", value: _ } <<<
    Deku.Attribute.prop'
