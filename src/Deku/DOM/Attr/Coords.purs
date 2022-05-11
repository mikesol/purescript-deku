module Deku.DOM.Attr.Coords where
import Deku.DOM.Elt.Area(Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Coords = Coords
instance Attr Area_ Coords String where
  attr Coords value = unsafeAttribute { key: "coords", value: prop' value }
