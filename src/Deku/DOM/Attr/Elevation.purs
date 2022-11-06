module Deku.DOM.Attr.Elevation where

import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Elevation = Elevation

instance Attr FeDistantLight_ Elevation String where
  attr Elevation value = unsafeAttribute
    { key: "elevation", value: prop' value }