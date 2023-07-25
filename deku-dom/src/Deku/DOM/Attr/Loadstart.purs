module Deku.DOM.Attr.Loadstart where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Loadstart = Loadstart

instance Deku.Attribute.Attr everything Loadstart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "loadstart", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Loadstart String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "loadstart", value: _ } <<<
    Deku.Attribute.prop'
