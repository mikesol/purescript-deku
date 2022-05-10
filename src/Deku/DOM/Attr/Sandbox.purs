module Deku.DOM.Attr.Sandbox where

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Sandbox = Sandbox

instance Attr Iframe_ Sandbox String where
  attr Sandbox value = unsafeAttribute { key: "sandbox", value: prop' value }
