module Deku.DOM.Attr.Importance where
import Deku.DOM.Elt.Iframe(Iframe_)
import Deku.DOM.Elt.Img(Img_)
import Deku.DOM.Elt.Link(Link_)
import Deku.DOM.Elt.Script(Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Importance = Importance
instance Attr Iframe_ Importance String where
  attr Importance value = unsafeAttribute { key: "importance", value: prop' value }

instance Attr Img_ Importance String where
  attr Importance value = unsafeAttribute { key: "importance", value: prop' value }

instance Attr Link_ Importance String where
  attr Importance value = unsafeAttribute { key: "importance", value: prop' value }

instance Attr Script_ Importance String where
  attr Importance value = unsafeAttribute { key: "importance", value: prop' value }
