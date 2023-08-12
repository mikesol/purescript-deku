module Deku.DOM.Attr.Headers where

import Prelude

import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Headers = Headers

instance Attr Td_ Headers String where
  attr Headers value = unsafeAttribute { key: "headers", value: prop' value }

instance Attr Th_ Headers String where
  attr Headers value = unsafeAttribute { key: "headers", value: prop' value }

instance Attr everything Headers Unit where
  attr Headers _ = unsafeAttribute
    { key: "headers", value: unset' }
