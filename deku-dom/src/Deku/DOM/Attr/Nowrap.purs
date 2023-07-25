module Deku.DOM.Attr.Nowrap where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)

data Nowrap = Nowrap

instance Deku.Attribute.Attr everything Nowrap Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "nowrap", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Td_ Nowrap String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "nowrap", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Th_ Nowrap String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "nowrap", value: _ } <<< Deku.Attribute.prop'
