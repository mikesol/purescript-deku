module Deku.DOM.Attr.Coords where

import Prelude

import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Coords = Coords

instance Attr Area_ Coords String where
  attr Coords value = unsafeAttribute { key: "coords", value: prop' value }

instance Attr everything Coords Unit where
  attr Coords _ = unsafeAttribute
    { key: "coords", value: unset' }
