module Deku.DOM.Attr.Copy where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Copy = Copy

instance Deku.Attribute.Attr everything Copy Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "copy", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Copy String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "copy", value: _ } <<< Deku.Attribute.prop'
