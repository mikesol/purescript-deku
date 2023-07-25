module Deku.DOM.Attr.Archive where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Object (Object_)

data Archive = Archive

instance Deku.Attribute.Attr everything Archive Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "archive", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Object_ Archive String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "archive", value: _ } <<< Deku.Attribute.prop'
