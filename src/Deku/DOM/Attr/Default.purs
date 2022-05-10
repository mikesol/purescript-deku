module Deku.DOM.Attr.Default where

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Default = Default

instance Attr Track_ Default String where
  attr Default value = unsafeAttribute { key: "default", value: prop' value }
