module Deku.DOM.Attr.Rx where

import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Rx = Rx

instance Attr Ellipse_ Rx String where
  attr Rx value = unsafeAttribute { key: "rx", value: prop' value }
instance Attr Rect_ Rx String where
  attr Rx value = unsafeAttribute { key: "rx", value: prop' value }