module Deku.DOM.Attr.Kind where

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Kind = Kind

instance Attr Track_ Kind String where
  attr Kind value = unsafeAttribute { key: "kind", value: prop' value }
