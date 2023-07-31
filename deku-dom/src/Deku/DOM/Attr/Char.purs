module Deku.DOM.Attr.Char where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Tr (Tr_)

data Char = Char

instance Deku.Attribute.Attr everything Char Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "char", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Col_ Char String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "char", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Tbody_ Char String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "char", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Td_ Char String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "char", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Th_ Char String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "char", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Tr_ Char String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "char", value: _ } <<< Deku.Attribute.prop'
