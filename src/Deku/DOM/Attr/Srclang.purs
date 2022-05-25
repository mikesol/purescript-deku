module Deku.DOM.Attr.Srclang where

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Srclang = Srclang

instance Attr Track_ Srclang String where
  attr Srclang value = unsafeAttribute { key: "srclang", value: prop' value }
