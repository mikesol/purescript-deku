module Deku.DOM.Attr.ViewBox where

import Prelude

import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ViewBox = ViewBox

instance Attr Marker_ ViewBox String where
  attr ViewBox value = unsafeAttribute { key: "viewBox", value: prop' value }

instance Attr Pattern_ ViewBox String where
  attr ViewBox value = unsafeAttribute { key: "viewBox", value: prop' value }

instance Attr Svg_ ViewBox String where
  attr ViewBox value = unsafeAttribute { key: "viewBox", value: prop' value }

instance Attr Symbol_ ViewBox String where
  attr ViewBox value = unsafeAttribute { key: "viewBox", value: prop' value }

instance Attr View_ ViewBox String where
  attr ViewBox value = unsafeAttribute { key: "viewBox", value: prop' value }

instance Attr everything ViewBox Unit where
  attr ViewBox _ = unsafeAttribute
    { key: "viewBox", value: unset' }
