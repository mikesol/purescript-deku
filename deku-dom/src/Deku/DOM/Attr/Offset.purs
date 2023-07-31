module Deku.DOM.Attr.Offset where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.Stop (Stop_)

data Offset = Offset

instance Deku.Attribute.Attr everything Offset Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "offset", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeComponentTransfer_ Offset String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "offset", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Stop_ Offset String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "offset", value: _ } <<< Deku.Attribute.prop'
