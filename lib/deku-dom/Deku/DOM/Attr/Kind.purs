module Deku.DOM.Attr.Kind where

import Prelude

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Kind = Kind

instance Attr Track_ Kind String where
  attr Kind value = unsafeAttribute { key: "kind", value: prop' value }

instance Attr everything Kind Unit where
  attr Kind _ = unsafeAttribute
    { key: "kind", value: unset' }
