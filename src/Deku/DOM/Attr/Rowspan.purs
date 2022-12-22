module Deku.DOM.Attr.Rowspan where

import Prelude

import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rowspan = Rowspan

instance Attr Td_ Rowspan String where
  attr Rowspan value = unsafeAttribute { key: "rowspan", value: prop' value }

instance Attr Th_ Rowspan String where
  attr Rowspan value = unsafeAttribute { key: "rowspan", value: prop' value }

instance Attr everything Rowspan Unit where
  attr Rowspan _ = unsafeAttribute
    { key: "rowspan", value: unset' }
