module Deku.DOM.Attr.Download where

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Download = Download

instance Attr A_ Download String where
  attr Download value = unsafeAttribute { key: "download", value: prop' value }

instance Attr Area_ Download String where
  attr Download value = unsafeAttribute { key: "download", value: prop' value }
