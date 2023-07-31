module Deku.DOM.Attr.Rowspan where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)

data Rowspan = Rowspan

instance Deku.Attribute.Attr everything Rowspan Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "rowspan", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Td_ Rowspan String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "rowspan", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Th_ Rowspan String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "rowspan", value: _ } <<< Deku.Attribute.prop'
