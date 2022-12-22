module Deku.DOM.Attr.Sandbox where

import Prelude

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Sandbox = Sandbox

instance Attr Iframe_ Sandbox String where
  attr Sandbox value = unsafeAttribute { key: "sandbox", value: prop' value }

instance Attr everything Sandbox Unit where
  attr Sandbox _ = unsafeAttribute
    { key: "sandbox", value: unset' }
