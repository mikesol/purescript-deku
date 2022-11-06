module Deku.DOM.Attr.Azimuth where

import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Azimuth = Azimuth

instance Attr FeDistantLight_ Azimuth String where
  attr Azimuth value = unsafeAttribute { key: "azimuth", value: prop' value }