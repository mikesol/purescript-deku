module Deku.DOM.Attr.Allow where

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Allow = Allow

instance Attr Iframe_ Allow String where
  attr Allow value = unsafeAttribute { key: "allow", value: prop' value }
