module Deku.DOM.Attr.Offset where

import Prelude

import Deku.DOM.Elt.Stop (Stop_)
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Offset = Offset

instance Attr FeFuncA_ Offset String where
  attr Offset value = unsafeAttribute { key: "offset", value: prop' value }

instance Attr FeFuncB_ Offset String where
  attr Offset value = unsafeAttribute { key: "offset", value: prop' value }

instance Attr FeFuncG_ Offset String where
  attr Offset value = unsafeAttribute { key: "offset", value: prop' value }

instance Attr FeFuncR_ Offset String where
  attr Offset value = unsafeAttribute { key: "offset", value: prop' value }

instance Attr Stop_ Offset String where
  attr Offset value = unsafeAttribute { key: "offset", value: prop' value }

instance Attr everything Offset Unit where
  attr Offset _ = unsafeAttribute
    { key: "offset", value: unset' }
