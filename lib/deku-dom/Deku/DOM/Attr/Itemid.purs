module Deku.DOM.Attr.Itemid where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Itemid = Itemid

instance Deku.Attribute.Attr everything Itemid Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "itemid", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Itemid String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "itemid", value: _ } <<< Deku.Attribute.prop'
