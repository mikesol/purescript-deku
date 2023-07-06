module Deku.DOM.Attr.Csp where

import Prelude

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Csp = Csp

instance Attr Iframe_ Csp String where
  attr Csp value = unsafeAttribute { key: "csp", value: prop' value }

instance Attr everything Csp Unit where
  attr Csp _ = unsafeAttribute
    { key: "csp", value: unset' }
