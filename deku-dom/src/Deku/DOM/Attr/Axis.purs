module Deku.DOM.Attr.Axis where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)

data Axis = Axis

instance Deku.Attribute.Attr everything Axis Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "axis", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Td_ Axis String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "axis", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Th_ Axis String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "axis", value: _ } <<< Deku.Attribute.prop'
