module Deku.DOM.Attr.Hreflang where

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Hreflang = Hreflang

instance Attr A_ Hreflang String where
  attr Hreflang value = unsafeAttribute { key: "hreflang", value: prop' value }

instance Attr Area_ Hreflang String where
  attr Hreflang value = unsafeAttribute { key: "hreflang", value: prop' value }

instance Attr Link_ Hreflang String where
  attr Hreflang value = unsafeAttribute { key: "hreflang", value: prop' value }
