module Deku.DOM.Attr.ZoomAndPan where

import Deku.DOM.Elt.View (View_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data ZoomAndPan = ZoomAndPan

instance Attr View_ ZoomAndPan String where
  attr ZoomAndPan value = unsafeAttribute
    { key: "zoomAndPan", value: prop' value }