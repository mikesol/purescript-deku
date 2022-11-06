module Deku.DOM.Attr.Dy where

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Dy = Dy

instance Attr FeDropShadow_ Dy String where
  attr Dy value = unsafeAttribute { key: "dy", value: prop' value }

instance Attr FeOffset_ Dy String where
  attr Dy value = unsafeAttribute { key: "dy", value: prop' value }

instance Attr Text_ Dy String where
  attr Dy value = unsafeAttribute { key: "dy", value: prop' value }

instance Attr Tspan_ Dy String where
  attr Dy value = unsafeAttribute { key: "dy", value: prop' value }