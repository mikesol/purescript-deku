module Deku.DOM.Attr.Loadedmetadata where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Loadedmetadata = Loadedmetadata

instance Deku.Attribute.Attr everything Loadedmetadata Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "loadedmetadata", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Loadedmetadata String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "loadedmetadata", value: _ } <<<
    Deku.Attribute.prop'
