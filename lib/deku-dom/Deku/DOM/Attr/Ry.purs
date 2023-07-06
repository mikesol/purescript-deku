module Deku.DOM.Attr.Ry where

import Prelude

import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Ry = Ry

instance Attr Ellipse_ Ry String where
  attr Ry value = unsafeAttribute { key: "ry", value: prop' value }

instance Attr Rect_ Ry String where
  attr Ry value = unsafeAttribute { key: "ry", value: prop' value }

instance Attr everything Ry Unit where
  attr Ry _ = unsafeAttribute
    { key: "ry", value: unset' }
