module Deku.DOM.Attr.Itemref where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Itemref = Itemref

instance Deku.Attribute.Attr everything Itemref Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "itemref", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Itemref String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "itemref", value: _ } <<< Deku.Attribute.prop'
