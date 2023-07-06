module Deku.DOM.Attr.Allow where

import Prelude

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Allow = Allow

instance Attr Iframe_ Allow String where
  attr Allow value = unsafeAttribute { key: "allow", value: prop' value }

instance Attr everything Allow Unit where
  attr Allow _ = unsafeAttribute
    { key: "allow", value: unset' }
