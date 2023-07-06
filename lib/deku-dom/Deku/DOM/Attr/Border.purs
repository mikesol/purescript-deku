module Deku.DOM.Attr.Border where

import Prelude

import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Object (Object_)
import Deku.DOM.Elt.Table (Table_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Border = Border

instance Attr Img_ Border String where
  attr Border value = unsafeAttribute { key: "border", value: prop' value }

instance Attr Object_ Border String where
  attr Border value = unsafeAttribute { key: "border", value: prop' value }

instance Attr Table_ Border String where
  attr Border value = unsafeAttribute { key: "border", value: prop' value }

instance Attr everything Border Unit where
  attr Border _ = unsafeAttribute
    { key: "border", value: unset' }
