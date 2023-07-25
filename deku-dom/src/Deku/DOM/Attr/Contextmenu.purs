module Deku.DOM.Attr.Contextmenu where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Contextmenu = Contextmenu

instance Deku.Attribute.Attr everything Contextmenu Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "contextmenu", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Contextmenu String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "contextmenu", value: _ } <<<
    Deku.Attribute.prop'
