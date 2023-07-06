module Deku.DOM.Attr.Rx where

import Prelude

import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rx = Rx

instance Attr Ellipse_ Rx String where
  attr Rx value = unsafeAttribute { key: "rx", value: prop' value }

instance Attr Rect_ Rx String where
  attr Rx value = unsafeAttribute { key: "rx", value: prop' value }

instance Attr everything Rx Unit where
  attr Rx _ = unsafeAttribute
    { key: "rx", value: unset' }
