module Deku.DOM.Attr.Valign where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Tr (Tr_)

data Valign = Valign

instance Deku.Attribute.Attr everything Valign Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "valign", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Col_ Valign String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "valign", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Tbody_ Valign String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "valign", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Td_ Valign String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "valign", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Th_ Valign String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "valign", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Tr_ Valign String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "valign", value: _ } <<< Deku.Attribute.prop'
