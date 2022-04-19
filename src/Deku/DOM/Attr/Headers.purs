module Deku.DOM.Attr.Headers where
import Deku.DOM.Elt.Td(Td_)
import Deku.DOM.Elt.Th(Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Headers = Headers
instance Attr Td_ Headers String where
  attr Headers value = unsafeAttribute { key: "headers", value: prop' value }

instance Attr Th_ Headers String where
  attr Headers value = unsafeAttribute { key: "headers", value: prop' value }
