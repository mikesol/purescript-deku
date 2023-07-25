module Deku.DOM.Attr.Scope where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)

data Scope = Scope

instance Deku.Attribute.Attr everything Scope Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "scope", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Td_ Scope String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "scope", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Th_ Scope String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "scope", value: _ } <<< Deku.Attribute.prop'
