module Deku.DOM.Attr.Itemtype where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Itemtype = Itemtype

instance Deku.Attribute.Attr everything Itemtype Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "itemtype", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Itemtype String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "itemtype", value: _ } <<< Deku.Attribute.prop'
