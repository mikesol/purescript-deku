module Deku.DOM.Attr.Hreflang where

import Prelude

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Hreflang = Hreflang

instance Attr A_ Hreflang String where
  attr Hreflang value = unsafeAttribute { key: "hreflang", value: prop' value }

instance Attr Area_ Hreflang String where
  attr Hreflang value = unsafeAttribute { key: "hreflang", value: prop' value }

instance Attr Link_ Hreflang String where
  attr Hreflang value = unsafeAttribute { key: "hreflang", value: prop' value }

instance Attr everything Hreflang Unit where
  attr Hreflang _ = unsafeAttribute
    { key: "hreflang", value: unset' }
