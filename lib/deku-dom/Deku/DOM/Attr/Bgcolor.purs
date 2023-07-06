module Deku.DOM.Attr.Bgcolor where

import Prelude

import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Colgroup (Colgroup_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Tbody (Tbody_)
import Deku.DOM.Elt.Tfoot (Tfoot_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.DOM.Elt.Tr (Tr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Bgcolor = Bgcolor

instance Attr Body_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Col_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Colgroup_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Table_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Tbody_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Tfoot_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Td_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Th_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr Tr_ Bgcolor String where
  attr Bgcolor value = unsafeAttribute { key: "bgcolor", value: prop' value }

instance Attr everything Bgcolor Unit where
  attr Bgcolor _ = unsafeAttribute
    { key: "bgcolor", value: unset' }
