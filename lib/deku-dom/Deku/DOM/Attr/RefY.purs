module Deku.DOM.Attr.RefY where

import Prelude

import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data RefY = RefY

instance Attr Marker_ RefY String where
  attr RefY value = unsafeAttribute { key: "refY", value: prop' value }

instance Attr Symbol_ RefY String where
  attr RefY value = unsafeAttribute { key: "refY", value: prop' value }

instance Attr everything RefY Unit where
  attr RefY _ = unsafeAttribute
    { key: "refY", value: unset' }
