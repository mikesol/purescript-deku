module Deku.DOM.Attr.Volumechange where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Volumechange = Volumechange

instance Deku.Attribute.Attr everything Volumechange Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "volumechange", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Volumechange String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "volumechange", value: _ } <<<
    Deku.Attribute.prop'
