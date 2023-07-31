module Deku.DOM.Attr.Colspan where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)

data Colspan = Colspan

instance Deku.Attribute.Attr everything Colspan Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "colspan", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Td_ Colspan String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "colspan", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Th_ Colspan String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "colspan", value: _ } <<< Deku.Attribute.prop'
