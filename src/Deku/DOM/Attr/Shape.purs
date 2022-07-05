module Deku.DOM.Attr.Shape where
import Deku.DOM.Elt.A(A_)
import Deku.DOM.Elt.Area(Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Shape = Shape
instance Attr A_ Shape String where
  attr Shape value = unsafeAttribute { key: "shape", value: prop' value }

instance Attr Area_ Shape String where
  attr Shape value = unsafeAttribute { key: "shape", value: prop' value }
