module Deku.DOM.Attr.Cx where

import Prelude

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Cx = Cx

instance Attr Circle_ Cx String where
  attr Cx value = unsafeAttribute { key: "cx", value: prop' value }

instance Attr Ellipse_ Cx String where
  attr Cx value = unsafeAttribute { key: "cx", value: prop' value }

instance Attr RadialGradient_ Cx String where
  attr Cx value = unsafeAttribute { key: "cx", value: prop' value }

instance Attr everything Cx Unit where
  attr Cx _ = unsafeAttribute
    { key: "cx", value: unset' }
