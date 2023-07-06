module Deku.DOM.Attr.Srclang where

import Prelude

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Srclang = Srclang

instance Attr Track_ Srclang String where
  attr Srclang value = unsafeAttribute { key: "srclang", value: prop' value }

instance Attr everything Srclang Unit where
  attr Srclang _ = unsafeAttribute
    { key: "srclang", value: unset' }
