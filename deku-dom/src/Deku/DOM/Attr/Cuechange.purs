module Deku.DOM.Attr.Cuechange where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Cuechange = Cuechange

instance Deku.Attribute.Attr everything Cuechange Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "cuechange", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Cuechange String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "cuechange", value: _ } <<<
    Deku.Attribute.prop'
