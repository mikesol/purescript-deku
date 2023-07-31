module Deku.DOM.Attr.Charoff where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Tr (Tr_)

data Charoff = Charoff

instance Deku.Attribute.Attr everything Charoff Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "charoff", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Col_ Charoff String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "charoff", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Tbody_ Charoff String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "charoff", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Td_ Charoff String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "charoff", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Th_ Charoff String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "charoff", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Tr_ Charoff String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "charoff", value: _ } <<< Deku.Attribute.prop'
