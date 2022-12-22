module Deku.DOM.Attr.Background where

import Prelude

import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Background = Background

instance Attr Body_ Background String where
  attr Background value = unsafeAttribute
    { key: "background", value: prop' value }

instance Attr Table_ Background String where
  attr Background value = unsafeAttribute
    { key: "background", value: prop' value }

instance Attr Td_ Background String where
  attr Background value = unsafeAttribute
    { key: "background", value: prop' value }

instance Attr Th_ Background String where
  attr Background value = unsafeAttribute
    { key: "background", value: prop' value }

instance Attr everything Background Unit where
  attr Background _ = unsafeAttribute
    { key: "background", value: unset' }
