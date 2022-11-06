module Deku.DOM.Attr.Dx where

import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Dx = Dx

instance Attr FeDropShadow_ Dx String where
  attr Dx value = unsafeAttribute { key: "dx", value: prop' value }

instance Attr FeOffset_ Dx String where
  attr Dx value = unsafeAttribute { key: "dx", value: prop' value }

instance Attr Text_ Dx String where
  attr Dx value = unsafeAttribute { key: "dx", value: prop' value }

instance Attr Tspan_ Dx String where
  attr Dx value = unsafeAttribute { key: "dx", value: prop' value }