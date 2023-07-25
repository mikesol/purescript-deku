module Deku.DOM.Attr.Autofocus where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Autofocus = Autofocus

instance Deku.Attribute.Attr everything Autofocus Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "autofocus", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Autofocus String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "autofocus", value: _ } <<<
    Deku.Attribute.prop'
