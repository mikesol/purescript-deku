module Deku.DOM.Attr.ZoomAndPan where

import Prelude

import Deku.DOM.Elt.View (View_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ZoomAndPan = ZoomAndPan

instance Attr View_ ZoomAndPan String where
  attr ZoomAndPan value = unsafeAttribute
    { key: "zoomAndPan", value: prop' value }

instance Attr everything ZoomAndPan Unit where
  attr ZoomAndPan _ = unsafeAttribute
    { key: "zoomAndPan", value: unset' }
