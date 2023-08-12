module Deku.DOM.Attr.Colspan where

import Prelude

import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Colspan = Colspan

instance Attr Td_ Colspan String where
  attr Colspan value = unsafeAttribute { key: "colspan", value: prop' value }

instance Attr Th_ Colspan String where
  attr Colspan value = unsafeAttribute { key: "colspan", value: prop' value }

instance Attr everything Colspan Unit where
  attr Colspan _ = unsafeAttribute
    { key: "colspan", value: unset' }
