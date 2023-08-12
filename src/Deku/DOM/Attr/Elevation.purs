module Deku.DOM.Attr.Elevation where

import Prelude

import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Elevation = Elevation

instance Attr FeDistantLight_ Elevation String where
  attr Elevation value = unsafeAttribute
    { key: "elevation", value: prop' value }

instance Attr everything Elevation Unit where
  attr Elevation _ = unsafeAttribute
    { key: "elevation", value: unset' }
