module Deku.DOM.Attr.Rel where
import Deku.DOM.Elt.A(A_)
import Deku.DOM.Elt.Area(Area_)
import Deku.DOM.Elt.Link(Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Rel = Rel
instance Attr A_ Rel String where
  attr Rel value = unsafeAttribute { key: "rel", value: prop' value }

instance Attr Area_ Rel String where
  attr Rel value = unsafeAttribute { key: "rel", value: prop' value }

instance Attr Link_ Rel String where
  attr Rel value = unsafeAttribute { key: "rel", value: prop' value }
