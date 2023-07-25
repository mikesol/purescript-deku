module Deku.DOM.Attr.Change where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Change = Change

instance Deku.Attribute.Attr everything Change Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "change", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Change String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "change", value: _ } <<< Deku.Attribute.prop'
