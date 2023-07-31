module Deku.DOM.Attr.TableValues where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)

data TableValues = TableValues

instance Deku.Attribute.Attr everything TableValues Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "tableValues", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeComponentTransfer_ TableValues String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "tableValues", value: _ } <<<
    Deku.Attribute.prop'
