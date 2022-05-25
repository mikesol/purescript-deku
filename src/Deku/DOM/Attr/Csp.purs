module Deku.DOM.Attr.Csp where

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Csp = Csp

instance Attr Iframe_ Csp String where
  attr Csp value = unsafeAttribute { key: "csp", value: prop' value }
